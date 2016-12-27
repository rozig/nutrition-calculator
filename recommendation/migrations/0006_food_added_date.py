# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0005_food_loves'),
    ]

    operations = [
        migrations.AddField(
            model_name='food',
            name='added_date',
            field=models.DateField(default=datetime.datetime(2016, 12, 27, 16, 39, 49, 491455, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
    ]
