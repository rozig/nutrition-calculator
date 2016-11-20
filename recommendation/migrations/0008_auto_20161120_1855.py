# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0007_user_activity_level'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='age',
            field=models.IntegerField(default=12),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='user',
            name='activity_level',
            field=models.FloatField(default=b'0'),
        ),
    ]
