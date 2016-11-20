#!/usr/bin/python
# -*- coding: utf-8 -*-
import urllib2
import json
import psycopg2 as pg
import sys

def fetch_foods(offset):
	conn = pg.connect(user='postgres', host='localhost', password='f02gemgs', database='dairy_nutrition')
	cursor = conn.cursor()
	cursor.execute("DELETE FROM foods;")
	print "Successfully truncated table."
	while offset < 77412:
		url = "http://api.nal.usda.gov/ndb/list?format=json&lt=f&max=500&offset=" + str(offset) + "&sort=id&api_key=F1aPLDn8zX7K0TRlxboPlODCxW8FUZZdbCYTPWD7"
		response = urllib2.urlopen(url)
		j = json.load(response)
		for i in j['list']['item']:
			id = i['id']
			name = i['name']
			cursor.execute("INSERT INTO foods(id, name) VALUES(%s, %s)", (id, name))
			offset = offset + 1
		print offset
	print "Successfully inserted data into table."
	conn.commit()
	conn.close()

def fetch_nutrients(offset):
	conn = pg.connect(user='postgres', host='localhost', password='f02gemgs', database='dairy_nutrition')
	cursor = conn.cursor()
	cursor.execute("DELETE FROM nutrients;")
	print "Successfully truncated table."
	while offset < 189:
		url = "http://api.nal.usda.gov/ndb/list?format=json&lt=n&max=500&offset=" + str(offset) + "&sort=id&api_key=F1aPLDn8zX7K0TRlxboPlODCxW8FUZZdbCYTPWD7"
		response = urllib2.urlopen(url)
		j = json.load(response)
		for i in j['list']['item']:
			id = i['id']
			name = i['name']
			cursor.execute("INSERT INTO nutrients(id, name) VALUES(%s, %s)", (id, name))
			offset = offset + 1
		print offset
	print "Successfully inserted data into table."
	conn.commit()
	conn.close()

def fetch_food_groups(offset):
	conn = pg.connect(user='postgres', host='localhost', password='f02gemgs', database='dairy_nutrition')
	cursor = conn.cursor()
	cursor.execute("DELETE FROM recommendation_food_groups;")
	print "Successfully truncated table."
	while offset < 25:
		url = "http://api.nal.usda.gov/ndb/list?format=json&lt=g&max=500&offset=" + str(offset) + "&sort=id&api_key=F1aPLDn8zX7K0TRlxboPlODCxW8FUZZdbCYTPWD7"
		response = urllib2.urlopen(url)
		j = json.load(response)
		for i in j['list']['item']:
			id = i['id']
			name = i['name']
			cursor.execute("INSERT INTO recommendation_food_groups(id, name) VALUES(%s, %s)", (id, name))
			print id, name
			offset = offset + 1
		print offset
	print "Successfully inserted data into table."
	conn.commit()
	conn.close()

def fetch_special_nutrients(offset):
	conn = pg.connect(user='postgres', host='localhost', password='f02gemgs', database='dairy_nutrition')
	cursor = conn.cursor()
	cursor.execute("DELETE FROM special_nutrients;")
	print "Successfully truncated table."
	while offset < 40:
		url = "http://api.nal.usda.gov/ndb/list?format=json&lt=ns&max=500&offset=" + str(offset) + "&sort=id&api_key=F1aPLDn8zX7K0TRlxboPlODCxW8FUZZdbCYTPWD7"
		response = urllib2.urlopen(url)
		j = json.load(response)
		for i in j['list']['item']:
			id = i['id']
			name = i['name']
			cursor.execute("INSERT INTO special_nutrients(id, name) VALUES(%s, %s)", (id, name))
			offset = offset + 1
		print offset
	print "Successfully inserted data into table."
	conn.commit()
	conn.close()

def fetch_standard_release_nutrients(offset):
	conn = pg.connect(user='postgres', host='localhost', password='f02gemgs', database='dairy_nutrition')
	cursor = conn.cursor()
	cursor.execute("DELETE FROM sr_nutrients;")
	print "Successfully truncated table."
	while offset < 150:
		url = "http://api.nal.usda.gov/ndb/list?format=json&lt=nr&max=500&offset=" + str(offset) + "&sort=id&api_key=F1aPLDn8zX7K0TRlxboPlODCxW8FUZZdbCYTPWD7"
		response = urllib2.urlopen(url)
		j = json.load(response)
		for i in j['list']['item']:
			id = i['id']
			name = i['name']
			cursor.execute("INSERT INTO sr_nutrients(id, name) VALUES(%s, %s)", (id, name))
			offset = offset + 1
		print offset
	print "Successfully inserted data into table."
	conn.commit()
	conn.close()

def select_food_id():
	food_ids = []
	conn = pg.connect(user='postgres', host='localhost', password='f02gemgs', database='dairy_nutrition')
	cursor = conn.cursor()
	cursor.execute("SELECT * FROM foods;")
	rows = cursor.fetchall()
	for row in rows:
		food_ids.append(row[0])
	conn.commit()
	conn.close()
	return food_ids

def get_food_reports():
	ids = select_food_id()
	for fr in ids:
		url = "http://api.nal.usda.gov/ndb/reports/?ndbno=" + fr + "&type=f&format=json&api_key=F1aPLDn8zX7K0TRlxboPlODCxW8FUZZdbCYTPWD7"
		response = urllib2.urlopen(url)
		j = json.load(response)
		for i in j['report']['food']:
			dbno = i['ndbno']
			name = i['name']
			sd = i['sd']
			fg = i['fg']

# fetch_foods(0)
# fetch_nutrients(0)
# fetch_special_nutrients(0)
# fetch_standard_release_nutrients(0)
fetch_food_groups(0)
# select_food_id()
# get_food_reports()