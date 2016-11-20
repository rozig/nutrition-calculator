# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Machine_Data',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('user', models.IntegerField()),
                ('food', models.CharField(max_length=20)),
                ('status', models.IntegerField(default=0)),
            ],
        ),
    ]
