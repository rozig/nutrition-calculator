# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('recommendation', '0009_food_and_user_is_favourite'),
    ]

    operations = [
        migrations.AddField(
            model_name='food',
            name='lovers',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL, through='recommendation.Food_and_User'),
        ),
        migrations.RemoveField(
            model_name='food',
            name='chief',
        ),
        migrations.AddField(
            model_name='food',
            name='chief',
            field=models.ForeignKey(related_name='foods', default=1, to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='food',
            name='group',
            field=models.ForeignKey(related_name='foods', to='recommendation.Food_Group'),
        ),
    ]
