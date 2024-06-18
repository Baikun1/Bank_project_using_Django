from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from decimal import Decimal
from .models import Client, Transaction

def account_history(request):
    if request.method == 'POST':
        account_number = request.POST.get('accountNumber')

        transactions = Transaction.objects.filter(account_no__account_no=account_number)

        if transactions.exists():
            return render(request, 'banking/account_history.html', {'transactions': transactions})
        else:
            messages.error(request, f'No transactions found for account number {account_number}.')
            return render(request, 'banking/account_history.html')

    return render(request, 'banking/account_history.html')

def index(request):
    return render(request, 'banking/index.html')

def create_new_user(request):
    if request.method == 'POST':
        accno = request.POST.get('accno')
        phno = request.POST.get('phno')
        name = request.POST.get('name')
        bal = request.POST.get('bal')
        pin = request.POST.get('pin')

        client = Client(account_no=accno, phno=phno, name=name, bal=bal, pin=pin)
        client.save()

        messages.success(request, "New user created successfully.")
        return redirect('index')

    return render(request, 'banking/create_user.html')

def delete_user(request):
    if request.method == 'POST':
        accno = request.POST.get('deleteAccno')

        try:
            client = Client.objects.get(account_no=accno)
            admin_account = Client.objects.get(account_no=1234567890)

            admin_account.bal += client.bal
            admin_account.save()

            client.delete()
            messages.success(request, f"User with account number {accno} deleted successfully, and their balance transferred to admin account.")
            return redirect('index')
        except Client.DoesNotExist:
            messages.error(request, "User account does not exist.")
            return redirect('index')

    return render(request, 'banking/delete_user.html')

def access_account(request):
    if request.method == 'POST':
        accno = request.POST.get('accno')
        pin = request.POST.get('pin')

        try:
            client = Client.objects.get(account_no=accno)

            if client.pin == int(pin):
                return render(request, 'banking/operation.html', {'client': client})
            else:
                messages.error(request, "Invalid PIN. Access denied.")
                return redirect('index')

        except Client.DoesNotExist:
            messages.error(request, "User account does not exist.")
            return redirect('index')

    return render(request, 'banking/access_account.html')

def create_transaction(client, transaction_type, amount):
    Transaction.objects.create(
        account_no=client,
        transaction_type=transaction_type,
        amount=amount
    )

def debit(request):
    if request.method == 'POST':
        accno = request.POST.get('accno')
        amount = Decimal(request.POST.get('withdrawAmount'))

        try:
            client = get_object_or_404(Client, account_no=accno)

            if client.bal >= amount:
                client.bal -= amount
                client.save()
                create_transaction(client, 'debit', amount)

                messages.success(request, f'{amount} has been debited from account {client.account_no}. Updated balance: {client.bal}')
                return redirect('index')
            else:
                messages.error(request, 'Insufficient balance.')
                return redirect('index')

        except Client.DoesNotExist:
            messages.error(request, "User account does not exist.")
            return redirect('index')

    return render(request, 'banking/operation.html', {'operation': 'Debit'})

def credit(request):
    if request.method == 'POST':
        accno = request.POST.get('accno')
        amount = Decimal(request.POST.get('depositAmount'))

        try:
            client = get_object_or_404(Client, account_no=accno)

            client.bal += amount
            client.save()
            create_transaction(client, 'credit', amount)

            messages.success(request, f'{amount} has been credited to account {client.account_no}. Updated balance: {client.bal}')
            return redirect('index')

        except Client.DoesNotExist:
            messages.error(request, "User account does not exist.")
            return redirect('index')

    return render(request, 'banking/operation.html', {'operation': 'Credit'})

def check_balance(request):
    if request.method == 'POST':
        accno = request.POST.get('balanceAccount')

        try:
            client = Client.objects.get(account_no=accno)
            messages.info(request, f'Balance for account {client.account_no}: {client.bal}')
            return redirect('index')

        except Client.DoesNotExist:
            messages.error(request, "User account does not exist.")
            return redirect('index')

    return render(request, 'banking/check_balance.html')
