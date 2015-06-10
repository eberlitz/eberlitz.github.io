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


$project 
like select

$match
like where

$skip
$limit

$unwind


[
{ "$match": { "field1": { "$gt": 0 }, "field2": { "$gt": 0 } } },
{ "$project": { "ratio": { "$divide": ["$field1","$field2"] }, "name": "field3" } },
{ "$sort": { "ratio": -1 } },
{ "$limit": 1 }
]


// Of the users in the "Brasilia" timezone who have tweeted 100 times or more,who has the largest number of followers?

result = db.tweets.aggregate([{ "$match": { "user.time_zone": "Brasilia", "user.statuses_count": { "$gte": 100 } } },
				            { "$project": { "followers": "$user.followers_count", 
				                          "screen_name": "$user.screen_name", 
				                          "tweets": "$user.statuses_count" } },
				            { "$sort" : { "followers": -1 } },
				            { "$limit" : 1 }]);


http://docs.mongodb.org/manual/reference/operator/aggregation/

[
	{ "$unwind" : "$entities.user_mentions" },
	{ "$group": { "_id": "$user.screen_name",
				  "count": { "$sum" : 1 }
				} },
	{ "$sort" : { "count": -1 } },
	{ "$limit": 1 }
]