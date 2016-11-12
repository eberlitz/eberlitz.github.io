---
layout: post
comments: true
title:  "Install an npm package directly from github"
excerpt: "This post shows how to install an npm package directly from github"
date:   2015-05-27 10:39:00
published:   true
---

Install an npm package directly from github
=========================================

Today I needed to install a package directly from npm because I've had to make some fixes in a third party library.
So to be abble to test and use before the external library was updated on npm registry I've found a way to install it using npm.
You can use the following command to install from git using the SSH protocol:

```bash
npm i git+ssh://git@github.com:eberlitz/angular2-img-cropper.git -S
```

or with HTTPS:

```bash
npm i git+https://git@github.com:eberlitz/angular2-img-cropper.git -S
```


References:

- [npm-install docs](https://docs.npmjs.com/cli/install)
