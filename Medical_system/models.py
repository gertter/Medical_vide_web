from django.db import models

class Patient(models.Model):
    name=models.CharField(max_length=10)
    sex=models.CharField(max_length=2)
    email=models.EmailField(max_length=20)
    tel=models.CharField(max_length=12)
    address=models.CharField(max_length=30)
    password=models.CharField(max_length=15)
    info=models.CharField(max_length=100)
    time = models.DateTimeField(auto_now=True)
class Doctor(models.Model):
    company=models.CharField(max_length=20)
    name=models.CharField(max_length=10)
    sex=models.CharField(max_length=2)
    email=models.EmailField(max_length=20)
    tel=models.CharField(max_length=12)
    address=models.CharField(max_length=30)
    password=models.CharField(max_length=15)
    person_info=models.CharField(max_length=100)
    hospital_info = models.CharField(max_length=100)
    time=models.DateTimeField(auto_now=True)

    def __str__(self):
        return u'%s' % (self.name)
class Video(models.Model):
    doctor=models.IntegerField(Doctor)
    title=models.CharField(max_length=50)
    file = models.FileField(upload_to='files/%Y%m%d%H%M%S/')
    time=models.DateTimeField(auto_now=True)
    info=models.CharField(max_length=100)
    def __str__(self):
        return u'%s' % (self.title)
class Commet(models.Model):
    patient=models.IntegerField(Patient)
    video=models.IntegerField(Video)
    time = models.DateTimeField(auto_now=True)
    info=models.CharField(max_length=100)

class Collection_doctor(models.Model):
    patient = models.IntegerField(Patient)
    doctor = models.IntegerField(Doctor)
    time = models.DateTimeField(auto_now=True)
class Collection_video(models.Model):
    patient = models.IntegerField(Patient)
    video = models.IntegerField(Video)
    time = models.DateTimeField(auto_now=True)
class Recode(models.Model):
    patient = models.IntegerField(Patient)
    video = models.IntegerField(Video)
    time = models.DateTimeField(auto_now=True)