---
layout: post
comments: true
title:  "How to scrap data with Node.JS"
excerpt: "Tutorial on how to get all your messages data from the tinder in a JSON format"
date:   2017-11-25 23:00:00
published:   true
author: Eduardo Eidelwein Berlitz
---

Sometime ago, I wanted to create a chat bot for studying conversational AI but I needed some data to train my models. So I thought to get all my chat messages from different services to use as a training data. Facebook and Google have a option in their site where you can get all your data, but Tinder doesn't (Now they have). So, I end up using a script in Node.js to do this. I'll describe the process, if you need the same.

In the script I just simulate the API calls from the Tinder Web. So the first step is to authenticate the API calls. For this, in each request that is made, it's necessary to include an `x-auth-token` in the request headers. To get this, I've just authenticated in the tinder web using Google Chrome, then using the developer tools in the requests tab, filtering by 'updates' you can copy the token header.

![Get Auth Token Header Image](http://eberlitz.github.io/assets/how-to-get-all-your-messages-data-from-tinder/auth-token.png)

Then, create a folder called 'tinder-data' with a file 'main.js' with the following content:

```js
const bluebird = require('bluebird');
const rq = require('request');
const fs = bluebird.promisifyAll(require('fs'));
const request = bluebird.promisify(rq.defaults({ jar: true, timeout: 60000, gzip: true }));

const headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36',
    'Connection': 'keep-alive',
    'Cache-Control': 'no-cache',
    'Pragma': 'no-cache',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'en-US,en;q=0.8,pt-BR;q=0.6,pt;q=0.4',
    'Accept': 'application/json, text/plain, */*'
};

function checkStatus(response) {
    if (response.statusCode === 401) {
        throw new Error('401: Unauthorized, insert your token in the script!');
    }
}

async function getMessages(match_id, page_token) {
    let data = [];
    let url = `https://api.gotinder.com/v2/matches/${match_id}/messages?count=100&locale=en`;
    page_token && (url += '&page_token=' + page_token);
    const response = await request({ url, headers });
    checkStatus(response);
    if (response.body) {
        let responseBody = JSON.parse(response.body);
        data = responseBody.data.messages;
        if (responseBody.data.next_page_token) {
            var others = await getMessages(match_id, responseBody.data.next_page_token);
            data = data.concat(others);
        }
    }
    return data;
}

async function getMatches(page_token) {
    let data = [];
    let url = 'https://api.gotinder.com/v2/matches?count=60&locale=en&message=1';
    page_token && (url += '&page_token=' + page_token);
    const response = await request({ url, headers });
    checkStatus(response);
    if (response.body) {
        let responseBody = JSON.parse(response.body);
        data = responseBody.data.matches;
        if (responseBody.data.next_page_token) {
            var others = await getMatches(responseBody.data.next_page_token);
            data = data.concat(others);
        }
    }
    return data;
}

async function getMatchesWithMessages() {
    const matches = await getMatches();
    return await Promise.all(matches.map(async m => {
        m.messages = await getMessages(m.id);
        m.messages = m.messages.reverse();
        return m;
    }));
}

(async () => {
    Object.assign(headers, {
        'x-auth-token': 'YOUR_TOKEN_HERE'
    });
    let data = await getMatchesWithMessages();
    data = JSON.stringify(data, null, 4);
    return await fs.writeFileAsync('./tinder.json', data, 'utf8');
})().catch(err => console.error(err));
```

Remember to change "YOUR_TOKEN_HERE" with the auth token previously taken with the Chrome Developer Tools.

Install the dependencies with `npm install request bluebird`.

Then run `node main.js`, and your data will be saved as a JSON file called `tinder.json` =]