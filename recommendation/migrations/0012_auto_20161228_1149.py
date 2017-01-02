# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0011_user_daily_calory'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='bmi',
            field=models.FloatField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='user',
            name='bmr',
            field=models.FloatField(default=1),
            preserve_default=False,
        ),
    ]
