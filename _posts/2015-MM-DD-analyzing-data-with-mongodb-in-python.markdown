---
layout: post
comments: true
title:  "Analyzing Data with MongoDB in Python"
excerpt: ""
date:   2015-01-01 18:00:00
published:   false
---

Analyzing Data with MongoDB in Python
=====================================




Aggregation Framework



```python
from pymongo import MongoClient
import pprint

client = MongoClient("mongodb://localhost:27017/")
db = client.twitter

def most_tweets():
	result = db.tweets.aggregate([
		{"$group": { "_id": "$user.screen_name", "count": { "$sum" : 1 } } },
		{"$sort": {"count": -1 } }
	])
	return result;

if __name__ == '__main__':
	result = most_tweets()
	pprint.pprint(result)
```






$group
$sort


$projet 
like select

$match
like where

$skip
$limit

$unwind





