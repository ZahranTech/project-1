#!/bin/bash

# التأكد من وجود Python 3.13
PYTHON_VERSION=$(python --version 2>&1)
echo "Python version: $PYTHON_VERSION"

# إنشاء virtual environment لو مش موجود
if [ ! -d "venv" ]; then
    echo "إنشاء virtual environment..."
    python -m venv venv
fi

# تفعيل الـ virtual environment
source venv/bin/activate

# تحديث pip
echo "تحديث pip..."
pip install --upgrade pip

# تثبيت الحزم من requirements.txt
echo "تثبيت الحزم من requirements.txt..."
pip install -r requirements.txt

# تنفيذ Migrations للتأكد من قاعدة البيانات
echo "تشغيل migrations..."
python manage.py makemigrations
python manage.py migrate

# إنشاء superuser مؤقت للتجربة (اختياري)
# echo "إنشاء superuser مؤقت..."
# python manage.py createsuperuser --noinput --username admin --email admin@example.com

# تشغيل السيرفر للتأكد إن كل حاجة شغالة
echo "تشغيل Django server لاختبار المشروع..."
python manage.py runserver

echo "✅ كل حاجة تمام، المشروع جاهز للعمل!"

