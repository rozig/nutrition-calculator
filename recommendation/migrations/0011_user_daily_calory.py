# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0010_auto_20161228_0245'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='daily_calory',
            field=models.FloatField(default=1),
            preserve_default=False,
        ),
    ]
