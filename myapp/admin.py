
from django.contrib import admin
from .models import Company, Department, Employee
from django.utils.html import format_html

class CompanyAdmin(admin.ModelAdmin):
    list_display = ('name', 'logo_tag')
    readonly_fields = ('logo_tag',)

    def logo_tag(self, obj):
        if obj.logo:
            return format_html('<img src="{}" width="50"/>', obj.logo.url)
        return '-'
    logo_tag.short_description = 'Logo'

class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('name', 'image_tag')
    readonly_fields = ('image_tag',)

    def image_tag(self, obj):
        if obj.image:
            return format_html('<img src="{}" width="50"/>', obj.image.url)
        return '-'
    image_tag.short_description = 'Image'

class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('name', 'company', 'department', 'photo_tag')
    readonly_fields = ('photo_tag',)

    def photo_tag(self, obj):
        if obj.photo:
            return format_html('<img src="{}" width="50"/>', obj.photo.url)
        return '-'
    photo_tag.short_description = 'Photo'

admin.site.register(Company, CompanyAdmin)
admin.site.register(Department, DepartmentAdmin)
admin.site.register(Employee, EmployeeAdmin)
