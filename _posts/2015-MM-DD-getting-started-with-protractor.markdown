---
layout: post
comments: true
title:  "Getting Started With Protractor"
excerpt: "This post shows how to get start with Protractor"
date:   2015-05-27 10:39:00
published:   false
---

# Getting Started With Protractor

Protractor is an end to and functional testing tool for your angularjs projects.
It is a wrapper for selenium web drive wich is a standard web page testing tool, but it adds some specific functionalitty to testing angularjs apps.


## Install

To get start make sure you have node and the node package manager (npm) installed.
You will need to install protractor globally by typing:

	$ npm install protractor -g

you also will need to install selenium web driver. When you installed protractor it also installed for us the webdriver manager so you just need to type:

	$ webdriver-manager update

with this selenium and chromedriver will be installed

## Configure

npm install protractor -g
webdriver-manager update
npm install -g cucumber chai chai-as-promised

protractor .\protractor.config.js

"pt": {
    "but": "*|Mas",
    "and": "*|E",
    "then": "*|Então|Entao",
    "when": "*|Quando",
    "name": "Portuguese",
    "native": "português",
    "background": "Contexto|Cenário de Fundo|Cenario de Fundo|Fundo",
    "feature": "Funcionalidade|Característica|Caracteristica",
    "scenario": "Cenário|Cenario",
    "scenario_outline": "Esquema do Cenário|Esquema do Cenario|Delineação do Cenário|Delineacao do Cenario",
    "examples": "Exemplos|Cenários|Cenarios",
    "given": "*|Dado|Dada|Dados|Dadas"
  },

