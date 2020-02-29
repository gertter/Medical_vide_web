import os
import time

from django.core.paginator import Paginator
from django.db.models import F
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render

from Medical_system.models import Patient, Doctor, Video, Commet, Collection_video, Collection_doctor, Recode


def index(request):
    try:
        patient_key = request.session['patient']
    except:
        patient_key=False
    try:
        doctor_key = request.session['doctor']
    except:
        doctor_key=False
    return render(request,'index.html',{'patient_key':patient_key,"doctor_key":doctor_key})
def signin(request):
    if request.method=='GET':
        return render(request, 'signin.html')
    if request.method=='POST':
        role = request.POST.get('role')
        email = request.POST.get('email')
        error = []
        password = request.POST.get('password')
        if role == "patient":
            if Patient.objects.filter(email=email):
                try:
                    p = Patient.objects.filter(email=email).filter(password=password)[0]
                    request.session['patient'] = {
                        "id": p.id,
                        "email": p.email,
                        "name": p.name,
                        "role": role,
                    }
                    request.session['doctor'] = False
                    return HttpResponseRedirect('/patient_info/')
                except:
                    error.append("密码错误！")
                    return render(request, 'signin.html', {"error": error})
            else:
                error.append("账户不存在！")
                return render(request, 'signin.html', {"error": error})
        else:
            if Doctor.objects.filter(email=email):
                try:
                    p = Doctor.objects.filter(email=email).filter(password=password)[0]
                    request.session['doctor'] = {
                        "id": p.id,
                        "email": p.email,
                        "name": p.name,
                        "role": role
                    }
                    request.session['patient'] = False
                    return HttpResponseRedirect('/doctor_info/')
                except:
                    error.append("密码错误")
                    return render(request, 'signin.html', {"error": error})
            else:
                error.append("账户不存在！")
                return render(request, 'signin.html', {"error": error})
def signup(request):
    if request.method=='GET':
        roles=request.GET.get("role")
        if roles=='patient':
            return render(request,'paitent/patient_signup.html')
        else:
            return render(request,'doctor/doctor_signup.html')
    if request.method=='POST':
        name=request.POST.get('name')
        sex = request.POST.get('sex')
        email = request.POST.get('email')
        tel = request.POST.get('tel')
        address = request.POST.get('address')
        password = request.POST.get('password')
        role = request.POST.get('role')
        if role=='patient':
            model=Patient
        else:
            com_name = request.POST.get('hosipital_name')
            model=Doctor
        try:
            model.objects.get(email=email)
            if role == 'patient':
                return render(request, 'paitent/patient_signup.html',{"error":"当前用户已经存在"})
            else:
                return render(request, 'doctor/doctor_signup.html',{"error":"当前用户已经存在"})
        except:
            if role=='patient':
                info=model(name=name,
                             sex=sex,
                             email=email,
                             tel=tel,
                             address=address,
                             password=password
                             )
                info.save()
            else:
                info = model(
                    company=com_name,
                    name=name,
                     sex=sex,
                     email=email,
                     tel=tel,
                     address=address,
                     password=password
                     )
                info.save()
        return HttpResponseRedirect('/signin/?role='+role)
def logout(request):
    key=request.GET.get('key')
    if key=='admin':
        request.session['super_manager'] = False
        return HttpResponseRedirect('/admin_login/')
    else:
        request.session['patient'] = False
        request.session['doctor'] = False
        return HttpResponseRedirect('/signin/')
def paly(request):
    errors=request.GET.get('error')
    if errors==None or errors=='':
        error=False
    else:
        error=errors
    video_id = request.GET.get('video_id')
    key = request.GET.get('key')
    if request.method=='GET':
        author_key=False
        info=Video.objects.get(id=video_id)
        doctor=Doctor.objects.get(id=info.doctor)
        try:
            patient_key = request.session['patient']
        except:
            patient_key = False
        try:
            doctor_key = request.session['doctor']
        except:
            doctor_key = False
        if patient_key!=False:
            patient=patient_key['id']
            video=video_id
            recode=Recode.objects.filter(video=video).order_by(F('id').desc())
            if len(recode)==0:
                re=Recode(patient=patient,video=video)
                re.save()
            else:
                change_time=Recode.objects.get(video=video)
                from datetime import datetime
                dt = datetime.now()
                current_time=dt.strftime('%Y-%m-%d %H:%M:%S')
                change_time.time=current_time
                change_time.save()
        if key=='person' and doctor_key!=False:
            author_key=True
        commet_info=Commet.objects.filter(video=video_id).order_by(F('id').desc())
        for com in  commet_info:
            com.patient=Patient.objects.get(id=com.patient).name
        limit = 9
        all_commmet=len(commet_info)
        page_key=False
        if all_commmet>9:
            page_key=True
        p = Paginator(commet_info, limit)
        page = request.GET.get("page", 1)
        loaded = p.page(page)
        info_video=Video.objects.all().order_by(F('id').desc())#限量
        return render(request,'paly.html',{"video_info":info,
                                           'doctor':doctor,
                                           'patient_key':patient_key,
                                           "doctor_key":doctor_key,
                                           "author_key":author_key,
                                           "error":error,
                                           'key':key,
                                           "info_video":info_video,
                                           'all_commmet':all_commmet,
                                           'video_id':video_id,
                                           "commet_info":loaded,
                                            "page_key":page_key,
                                           })
    if request.method=='POST':
        try:
            patient_key = request.session['patient']
            patient=Patient.objects.get(id=patient_key['id']).id
            video=Video.objects.get(id=video_id).id
            info=request.POST.get('info')
            comemt=Commet(info=info,video=video,patient=patient)
            comemt.save()
            return HttpResponseRedirect("/paly_video/?video_id={0}&key={1}&error=评论成功".format(video_id, key))
        except Exception as e:

            return HttpResponseRedirect("/paly_video/?video_id={0}&key={1}&error=不能评论个人发布的视频".format(video_id,key))
def delete_person_video(request):
    key =request.GET.get('key')
    video=request.GET.get('video')
    if key=='doctor':
        info=Video.objects.get(id=video)
        file=info.file
        path='media/'+str(file)
        os.remove(path)
        info.delete()
        return HttpResponseRedirect('/manage_person_video/')
    if key=='patient':
        info=Collection_video.objects.get(video=video)
        info.delete()
        return HttpResponseRedirect("/patient_video/")
    if key=='d':
        info=Collection_doctor.objects.get(doctor=video)
        info.delete()
        return HttpResponseRedirect("/patient_doctor/")
    if key=='recode':
        info = Recode.objects.get(video=video)
        info.delete()
        return HttpResponseRedirect("/patient_record/")
    if key=='all':
        patient_key = request.session['patient']
        patient=patient_key['id']
        info = Recode.objects.filter(patient=patient)
        info.delete()
        return HttpResponseRedirect('/patient_record/')

def forget_password(request):
    key=request.GET.get('key')
    if request.method=='GET':
        error=request.GET.get("error")
        if error==None or error=='':
            error=False
        return render(request,'forget_password.html',{'error':error})
    if request.method=='POST':
        email=request.POST.get('email')
        password = request.POST.get('password')
        if key=='patient':
            try:
                p=Patient.objects.get(email=email)
                p.password=password
                p.save()
                return HttpResponseRedirect('/signin/')
            except:
                return HttpResponseRedirect('/forget_password/?key=patient&error=当前用户不存在')
        else:
            try:
                p = Doctor.objects.get(email=email)
                p.password = password
                p.save()
                return HttpResponseRedirect('/signin/')
            except:
                return HttpResponseRedirect('/forget_password/?key=clinic&error=当前用户不存在')
#病人
def collection_doctor(request):
    doctor_id=request.GET.get("doctor_id")
    patient_key = request.session['patient']
    patient = patient_key['id']
    if doctor_id!=None and doctor_id!='':
        info=Collection_doctor.objects.filter(doctor=doctor_id)
        if len(info)!=0:
            return HttpResponseRedirect('/patient_index/?error=收藏过了')
        else:
            info=Collection_doctor(doctor=doctor_id,patient=patient)
            info.save()
            return HttpResponseRedirect('/patient_index/?error=收藏成功')
    else:
        video_id = request.GET.get('video_id')
        video=Video.objects.get(id=video_id)
        doctor=video.doctor
        patient_key = request.session['patient']
        patient=patient_key['id']
        info=Collection_doctor.objects.filter(doctor=doctor)
        if len(info)!=0:
            return HttpResponseRedirect('/paly_video/?video_id={0}&key=outhor&error=收藏过了'.format(video_id))
        else:
            info=Collection_doctor(doctor=doctor,patient=patient)
            info.save()
            return HttpResponseRedirect('/paly_video/?video_id={0}&key=outhor&error=收藏成功'.format(video_id))
def patient_index(request):
    import time
    if request.method=="GET":
        patient_key = request.session['patient']
        video=Video.objects.all().order_by(F('id').desc())#限量
        doctor=Doctor.objects.all().order_by(F('id').desc())#限量
        error=False
        key=request.GET.get("error")
        if key!=None and key!='':
            error=key
        time_list=[]
        result=[]
        all_cance_doctor=Collection_doctor.objects.filter(patient=patient_key['id'])
        for i in all_cance_doctor:
            data={
                "dcotor":i.doctor,
                'time':i.time
            }
            time_list.append(data)
        for i in time_list:
            all_video=Video.objects.filter(doctor=i['dcotor'])
            for j in all_video:
                t1 = time.strptime(str(j.time).split('.')[0], "%Y-%m-%d %H:%M:%S")
                t2 = time.strptime(str(i['time']).split('.')[0], "%Y-%m-%d %H:%M:%S")
                cha=(int(time.mktime(t1) - time.mktime(t2)))
                if cha>0:
                    result.append(j.id)
        new_pb_list=[]
        for resu in result:
            videos=Video.objects.filter(id=resu)
            for l in videos:
                l.doctor=Doctor.objects.get(id=l.doctor).name
            new_pb_list.append(videos[0])
        if len(new_pb_list)==0:
            new_key=False
        else:
            new_key=True
        return render(request,'paitent/patient_index.html',{'patient_key':patient_key,"video":video,"doctor":doctor,'error':error,'new_pb_list':new_pb_list,'new_key':new_key})
def patient_record(request):
    try:
        patient_key = request.session['patient']
    except:
        patient_key = False
    key = True
    l = []
    my_video = Recode.objects.filter(patient=patient_key['id'])
    for i in my_video:
        videos = Video.objects.filter(id=i.video)
        for j in videos:
            j.time=i.time
        l.append(videos[0])
    if len(l) == 0:
        key = False
    return render(request,'paitent/Record.html',{'patient_key':patient_key,"video": l,'key':key})
def patient_info(request):
    if request.method=='GET':
        try:
            patient_key = request.session['patient']
        except:
            patient_key = False
        person_info=Patient.objects.filter(id=patient_key['id'])
        return render(request,'paitent/Patient_info.html',{'patient_key':patient_key,'person_info':person_info})
    if request.method=='POST':
        patient_key = request.session['patient']
        name = request.POST.get('name')
        sex = request.POST.get('sex')
        email = request.POST.get('email')
        tel = request.POST.get('tel')
        address = request.POST.get('address')
        per_info = request.POST.get('person_info')
        info=Patient.objects.get(id=patient_key['id'])
        info.name=name
        info.sex=sex
        info.email=email
        info.tel=tel
        info.address=address
        info.info=per_info
        info.save()
        return HttpResponseRedirect('/patient_info/')
def all_video(request):
    try:
        patient_key = request.session['patient']
    except:
        patient_key = False
    keyword = request.GET.get("keyword")
    if keyword != None and keyword != '':
        all_video = Video.objects.filter(title__icontains=keyword).order_by(F('id').desc())
        if len(all_video)!=0:
            for i in all_video:
                i.doctor = Doctor.objects.get(id=i.doctor).name
            return render(request, 'paitent/all_video.html', {'patient_key': patient_key, 'all_video': all_video})
        else:
            all_video = Video.objects.filter(info__icontains=keyword).order_by(F('id').desc())
            if len(all_video) != 0:
                for i in all_video:
                    i.doctor = Doctor.objects.get(id=i.doctor).name
                return render(request, 'paitent/all_video.html', {'patient_key': patient_key, 'all_video': all_video})

            else:
                doctor=Doctor.objects.filter(name__contains=keyword)
                for d in doctor:
                    all_video = Video.objects.filter(doctor=d.id).order_by(F('id').desc())
                    if len(all_video) != 0:
                        for i in all_video:
                            i.doctor = Doctor.objects.get(id=i.doctor).name
                        return render(request, 'paitent/all_video.html',
                                      {'patient_key': patient_key, 'all_video': all_video})

    else:
        doctor=request.GET.get('doctor')
        if doctor!=None and doctor!='':
            all_video=Video.objects.filter(doctor=doctor).order_by(F('id').desc())
            for i in all_video:
                i.doctor=Doctor.objects.get(id= i.doctor).name
            return render(request,'paitent/all_video.html',{'patient_key':patient_key,'all_video':all_video})
        else:
            all_video=Video.objects.all().order_by(F('id').desc())
            for i in all_video:
                i.doctor=Doctor.objects.get(id= i.doctor).name
            return render(request,'paitent/all_video.html',{'patient_key':patient_key,'all_video':all_video})
def patient_doctor(request):
    try:
        patient_key = request.session['patient']
    except:
        patient_key=False
    key = True
    l=[]
    my_video=Collection_doctor.objects.filter(patient=patient_key['id'])
    for i in my_video:
        doctors = Doctor.objects.filter(id=i.doctor)
        for j in doctors:
            j.person_info=len(Collection_doctor.objects.filter(doctor=j.id))
        doctor = doctors[0]
        l.append(doctor)
    if len(l)==0:
        key=False
    return render(request,'paitent/Patient_doctor.html',{'patient_key':patient_key,"doctor": l,'key':key})
def patient_video(request):
    try:
        patient_key = request.session['patient']
    except:
        patient_key=False
    key = True
    l=[]
    my_video=Collection_video.objects.filter(patient=patient_key['id'])
    for i in my_video:
        video=Video.objects.filter(id=i.video)[0]
        l.append(video)
    if len(l)==0:
        key=False
    return render(request,'paitent/patient_video.html',{'patient_key':patient_key,"video": l,'key':key})
def collection_video(request):
    patient_key = request.session['patient']
    patient=Patient.objects.get(id=patient_key['id']).id
    id=request.GET.get('video_id')
    video=Video.objects.get(id=id).id
    info=Collection_video.objects.filter(video=id)
    if len(info)!=0:
        return HttpResponseRedirect('/paly_video/?video_id={0}&key=outhor&error=收藏过了'.format(str(id)))
    else:
        inf=Collection_video(patient=patient,video=video)
        inf.save()
        return HttpResponseRedirect('/paly_video/?video_id={0}&key=outhor&error=收藏成功'.format(str(id)))

#医生
def delete_comment(request):
    commemt_id=request.GET.get("commemt_id")
    Commet.objects.get(id=commemt_id).delete()
    video=request.GET.get("video")
    return HttpResponseRedirect("/paly_video/?video_id={0}&key=person".format(video))
def doctor_info(request):
    doctor_key = request.session['doctor']
    if doctor_key == False:
        return HttpResponseRedirect('/signin/')
    else:
        if request.method=='GET':
            doctor_info = Doctor.objects.filter(id=doctor_key['id'])
            return render(request, 'doctor/profile.html', {"doctor_key": doctor_key, "doctor_info": doctor_info})
        if request.method=='POST':
            company=request.POST.get('company')
            name = request.POST.get('name')
            sex = request.POST.get('sex')
            email = request.POST.get('email')
            tel = request.POST.get('tel')
            address = request.POST.get('address')
            per_info = request.POST.get('person_info')
            com_info = request.POST.get('com_info')
            doctor=Doctor.objects.get(id=doctor_key['id'])
            doctor.company=company
            doctor.name=name
            doctor.sex=sex
            doctor.email=email
            doctor.tel=tel
            doctor.address=address
            doctor.person_info=per_info
            doctor.hospital_info=com_info
            doctor.save()
            return HttpResponseRedirect("/doctor_info/")
def publish_video(request):
    if request.method=="GET":
        doctor_key = request.session['doctor']
        return render(request,'doctor/pb_video.html',{"doctor_key": doctor_key})
    if request.method=='POST':
        doctor_key = request.session['doctor']
        doctor=doctor_key['id']
        title=request.POST.get("title")
        files = request.FILES.get("file")
        info=request.POST.get('info')
        video=Video(title=title,file=files,info=info,doctor=doctor)
        video.save()
        return render(request,'doctor/pb_video.html',{"error":"发布成功"})
def manage_person_video(request):
    if request.method=="GET":
        doctor_key = request.session['doctor']
        doctor=Doctor.objects.get(id=doctor_key['id'])
        my_video=Video.objects.filter(doctor=doctor.id)
        key=True
        if len(my_video)==0:
            key=False
        return render(request,'doctor/all_video.html',{'my_video':my_video,'key':key,"doctor_key": doctor_key})
#管理员
def admin_login(request):
    if request.method=="GET":
        try:
            p=request.session['super_manager']
            if p['super_manager']==True:
                return HttpResponseRedirect('/admin_patient/')
        except:
            return render(request, 'manage/admin_login.html')
    if request.method=='POST':
        name=request.POST.get('user')
        pwd=request.POST.get('pwd')
        if name=='admin' and pwd=='123456':
            request.session['super_manager'] = {
               'super_manager':True,
            }
            return HttpResponseRedirect('/admin_patient/')
        else:
            return render(request, 'manage/admin_login.html',{'error':'账户或者密码错误'})
def admin_patient(request):
    if request.method == "GET":
        try:
            p = request.session['super_manager']
            if p['super_manager'] == True:
                info=Patient.objects.all().order_by(F('id').desc())
                return render(request, 'manage/all_patient.html',{"info":info})
        except:
            return HttpResponseRedirect("/amdin_login/")
def admin_video(request):
    if request.method == "GET":
        try:
            p = request.session['super_manager']
            if p['super_manager'] == True:
                info=Video.objects.all().order_by(F('id').desc())
                for i in info:
                    i.doctor=Doctor.objects.get(id=i.doctor).name
                return render(request, 'manage/all_video.html',{"info":info})
        except:
            return HttpResponseRedirect("/amdin_login/")

def admin_doctor(request):
    try:
        p = request.session['super_manager']
        if p['super_manager'] == True:
            info = Doctor.objects.all().order_by(F('id').desc())

            return render(request, 'manage/all_doctor.html', {"info": info})
    except:
        return HttpResponseRedirect("/amdin_login/")
def admin_delete(request):
    id=request.GET.get('id')
    key=request.GET.get('key')
    if key=='patient':
        Patient.objects.get(id=id).delete()
        Commet.objects.filter(patient=id).delete()
        Collection_doctor.objects.filter(patient=id).delete()
        Collection_video.objects.filter(patient=id).delete()
        Recode.objects.filter(patient=id).delete()
        return HttpResponseRedirect('/admin_patient/')
    if key=='doctor':
        Doctor.objects.get(id=id).delete()
        Collection_doctor.objects.filter(patient=id).delete()
        return HttpResponseRedirect('/admin_doctor/')
    if key=='video':
        Video.objects.get(id=id).delete()
        Commet.objects.filter(video=id).delete()
        Collection_video.objects.filter(video=id).delete()
        Recode.objects.filter(video=id).delete()
        return HttpResponseRedirect('/admin_doctor/')