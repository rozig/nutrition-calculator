# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0003_auto_20161026_1402'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='is_fat',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='user',
            name='weight_diff',
            field=models.FloatField(default=0),
            preserve_default=False,
        ),
    ]
