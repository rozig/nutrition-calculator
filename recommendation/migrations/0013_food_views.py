# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0012_auto_20161228_1149'),
    ]

    operations = [
        migrations.AddField(
            model_name='food',
            name='views',
            field=models.IntegerField(default=0),
        ),
    ]
