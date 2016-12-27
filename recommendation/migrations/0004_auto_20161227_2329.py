# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0003_food_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='food',
            name='image',
            field=models.FileField(upload_to=b'foods/'),
        ),
    ]
