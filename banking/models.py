from django.db import models
from django.contrib.auth.models import User

class Client(models.Model):
    account_no = models.BigIntegerField(primary_key=True)
    phno = models.CharField(max_length=15)
    name = models.CharField(max_length=100)
    bal = models.DecimalField(max_digits=10, decimal_places=2)
    pin = models.IntegerField()

    def __str__(self):
        return f"Account No: {self.account_no}, Name: {self.name}, Pin: {self.pin}, Balance: {self.bal}"

class Transaction(models.Model):
    account_no = models.ForeignKey(Client, on_delete=models.CASCADE)
    transaction_type = models.CharField(max_length=100)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Account No: {self.account_no}, Type: {self.transaction_type}, Amount: {self.amount}, Timestamp: {self.timestamp}"