# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0008_auto_20161228_0217'),
    ]

    operations = [
        migrations.AddField(
            model_name='food_and_user',
            name='is_favourite',
            field=models.BooleanField(default=0),
            preserve_default=False,
        ),
    ]
