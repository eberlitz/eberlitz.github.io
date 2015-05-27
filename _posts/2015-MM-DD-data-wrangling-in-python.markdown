---
layout: post
comments: true
title:  "Data Wrangling in Python"
excerpt: "Data Wrangling in Python"
date:   2015-05-27 10:39:00
published:   false
---

Data Wrangling in Python
========================


--

Reading files
=============

	with open(filepath, "rb") as f:
		for line in f:
			print line

Parsing CSV Files
=================

	import csv

	def parse_csv:
		data = []
		with open(filepath, "rb") as f:
			r = csv.DictReader(f)
			for line in r:
				data.append(line)
		return data

Parsing XLS files
=================

	import xldr

	def parse_file(filepath):
		workbook = xlrd.open_workbook(filepath)
		sheet = workbook.sheet_by_index(0)

		data = [[sheet.cell_value(r,col)
					for col in range(sheet.ncols)]
						for r in range(sheet.nrows)]


Parsing JSON
============

	import json
	import requests

	def query_site(url, params):
	    r = requests.get(url, params=params)
	    print "requesting", r.url

	    if r.status_code == requests.codes.ok:
	        return r.json()
	    else:
	        r.raise_for_status()

Parsing XML
===========

def get_authors(root):
    authors = []
    for author in root.findall('./fm/bibl/aug/au'):
        data = {
                "fnm": None,
                "snm": None,
                "email": None,
                "insr": []
        }
        data["fnm"] = author.find('./fnm').text
        data["snm"] = author.find('./snm').text
        data["email"] = author.find('./email').text
        insr = author.findall('./insr')
        for i in insr:
            data["insr"].append(i.attrib["iid"])
        authors.append(data)

    return authors

Parsing HTML
============

from bs4 import BeautifulSoup
