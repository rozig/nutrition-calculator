# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0004_auto_20161106_1306'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='birth_date',
            field=models.DateField(default=b''),
        ),
        migrations.AlterField(
            model_name='user',
            name='gender',
            field=models.IntegerField(default=b'1'),
        ),
        migrations.AlterField(
            model_name='user',
            name='is_fat',
            field=models.IntegerField(default=b'0'),
        ),
        migrations.AlterField(
            model_name='user',
            name='weight_diff',
            field=models.FloatField(default=b'0'),
        ),
    ]
