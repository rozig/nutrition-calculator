# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0007_user_avatar'),
    ]

    operations = [
        migrations.CreateModel(
            name='Food_and_User',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='food',
            name='chief',
        ),
        migrations.AddField(
            model_name='food_and_user',
            name='food',
            field=models.ForeignKey(to='recommendation.Food'),
        ),
        migrations.AddField(
            model_name='food_and_user',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='food',
            name='chief',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, through='recommendation.Food_and_User'),
        ),
    ]
