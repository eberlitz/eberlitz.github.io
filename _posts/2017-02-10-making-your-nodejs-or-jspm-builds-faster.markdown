---
layout: post
comments: true
title:  "Making your Node.js or JSPM builds faster"
excerpt: "This post shows how to implement some very basic cache using symbolic links"
date:   2017-02-10 14:00:00
published:   true
---

Making your Node.js or JSPM builds faster
=========================================

Using a node projet in a Continuous Integration Enviroment can result in lots of packages checks and downloads in your server. 
You can make some simple adjusts to save some time.

One thing to do, is to use the native cache for download packages in the npm cli. For this all you need to do is install using this command line:

```bash
npm --cache-min=999999 install
```

Another tip is to save time of the checking for installed packages by crating a symbolic link for the node_modules folder. Just like:

```bash
mklink /j .\node_modules\ "C:\\.cache\node_modules\"
```

The following script is a PowerShell script that I use to build my node and jspm project under TeamFoundationServer builds:

```bash
# Cria "node_modules" cache usando SymLink
$npmCacheFolder = ".\..\.cache\node_modules\"
$appNodeModulesFolder=".\node_modules\"
If (Test-Path $appNodeModulesFolder){
	Remove-Item $appNodeModulesFolder -Force -Recurse
}
New-Item -ItemType Directory -Force -Path $npmCacheFolder
cmd /c mklink /j $appNodeModulesFolder $npmCacheFolder


# Cria "jspm_packages" cache usando SymLink
$jspmCacheFolder = ".\..\.cache\jspm_packages\"
$appJspmPackagesFolder=".\client\jspm_packages\"
If (Test-Path $appJspmPackagesFolder){
	Remove-Item $appJspmPackagesFolder -Force -Recurse
}
New-Item -ItemType Directory -Force -Path $jspmCacheFolder
cmd /c mklink /j $appJspmPackagesFolder $jspmCacheFolder

# Instalar dependencias
# refresh the packages required by gulp (listed in the package.json file)
npm --cache-min=999999 install
```

