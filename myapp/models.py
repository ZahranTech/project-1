
from django.db import models
from cloudinary.models import CloudinaryField

class Company(models.Model):
    name = models.CharField(max_length=100)
    logo = CloudinaryField('logo', folder='companies', blank=True, null=True)

    def __str__(self):
        return self.name

class Department(models.Model):
    name = models.CharField(max_length=100)
    image = CloudinaryField('image', folder='companies', blank=True, null=True)

    def __str__(self):
        return self.name

class Employee(models.Model):
    name = models.CharField(max_length=100)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    photo = CloudinaryField('photo', folder='employees', blank=True, null=True)

    def __str__(self):
        return self.name
