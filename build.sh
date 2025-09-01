#!/usr/bin/env bash
# وقف عند أول خطأ
set -o errexit  

# تثبيت المتطلبات
pip install -r requirements.txt

# عمل الترحيلات
python manage.py migrate

# تجميع ملفات static
python manage.py collectstatic --noinput
