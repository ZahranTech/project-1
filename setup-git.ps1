param(
    [string]$UserName,
    [string]$UserEmail,
    [string]$RepoUrl
)

# ✅ تأكيد تشغيل Bypass مؤقتًا للجلسة دي فقط
if ((Get-ExecutionPolicy) -ne "Bypass") {
    Write-Host "🔒 ExecutionPolicy مقفول.. بفعّل Bypass مؤقتًا للجلسة دي" -ForegroundColor Yellow
    powershell -ExecutionPolicy Bypass -File $PSCommandPath @args
    exit
}

Write-Host "🚀 بدء إعداد المشروع..." -ForegroundColor Cyan

# ✅ إعداد Git
git init
git config user.name $UserName
git config user.email $UserEmail

# ✅ إضافة جميع الملفات
git add .
git commit -m "Initial commit"

# ✅ ربط الريبو البعيد
if ($RepoUrl -ne "") {
    git remote add origin $RepoUrl
    git branch -M main
    git push -u origin main
    Write-Host "✅ تم رفع المشروع إلى GitHub" -ForegroundColor Green
} else {
    Write-Host "⚠️ لم يتم إدخال رابط الريبو. الملفات جاهزة محليًا فقط." -ForegroundColor Yellow
}

Write-Host "🎉 تم الانتهاء بنجاح!" -ForegroundColor Green
