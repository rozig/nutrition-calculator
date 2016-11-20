# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0006_auto_20161120_1352'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='activity_level',
            field=models.IntegerField(default=b'0'),
        ),
    ]
