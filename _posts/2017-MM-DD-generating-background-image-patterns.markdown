---
layout: post
comments: true
title:  "Generating background image patterns"
excerpt: ""
date:   2017-09-05 12:00:00
published:   false
---

# Generating background image patterns

by Eduardo Eidelwein Berlitz



```
function generateSnapBackground(size) {
  var image = 'data:image/svg+xml;base64,' + btoa("<svg xmlns='http://www.w3.org/2000/svg' width='" + size + "' height='" + size + "' viewBox='0 0 10 10'><g id='b'><rect x='0' y='0' fill-opacity='0.1' id='s' fill='#000' width='9' height='9' /></g></svg>");
  this.element.style.backgroundImage = 'url('+image+')';
}
