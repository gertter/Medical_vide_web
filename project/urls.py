"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from django.urls import path, re_path
from django.views.static import serve
from Medical_system.views import *
from project import settings

urlpatterns = [
    url(r'^static/(?P<path>.*)$', serve,
        {'document_root': settings.STATIC_ROOT}, name='static'),
    re_path(r'media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    url(r'^media/(?P<path>.*)$', serve,
        {'document_root': settings.MEDIA_ROOT}, name='media'),
    path('admin/', admin.site.urls),
    path('',index),
    path('signin/',signin),
    path('paly_video/',paly),
    path('logout/',logout),
    path('delete_person_video/',delete_person_video),
    path('collection_video/',collection_video),
    path('forget_password/',forget_password),
    #病人
    path('collection_doctor/',collection_doctor),
    path('patient_index/',patient_index),
    path('patient_record/',patient_record),
    path('patient_info/',patient_info),
    path('all_video/',all_video),
    path('patient_doctor/',patient_doctor),
    path('patient_video/',patient_video),
    path('signup/',signup),
    #医生
    path('doctor_info/',doctor_info),
    path('delete_comment/',delete_comment),
    path('publish_video/', publish_video),
    path('manage_person_video/',manage_person_video),
    #管理员
    path('admin_login/',admin_login),
    path('admin_patient/',admin_patient),
    path('admin_vodeo/',admin_video),
    path('admin_doctor/',admin_doctor),
    path('admin_delete/',admin_delete),
]
