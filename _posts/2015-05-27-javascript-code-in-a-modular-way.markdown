---
layout: post
comments: true
title:  "JavaScript code in a modular way"
excerpt: "This post shows how to create a single JavaScript code to run in browser or Node.js environments"
date:   2015-05-27 10:39:00
published:   true
---

Sometimes we create JavaScript codes that could run in a **browser** or in a **Node.js** environment. The way we register the module in each environment is different. But we can define a single code that deals with this and allow us to run the same module. To to this we use some concept called **UMD** (*Universal Module Definition*). Here I will show just the basic but you can see more samples at [UMD (Universal Module Definition)](https://github.com/umdjs/umd).

To to this, just wrap your JavaScript code with the following:

```js
(function(global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
        typeof define === 'function' && define.amd ? define(factory) :
        global.yourModuleName = factory()
}(this, function() {
    'use strict';
    // ---------------------------------------------------------
    //  var yourModuleName = Your Code Here (function or object)
    // ---------------------------------------------------------
    return yourModuleName;
}));
```

### References

- [UMD (Universal Module Definition)](https://github.com/umdjs/umd)