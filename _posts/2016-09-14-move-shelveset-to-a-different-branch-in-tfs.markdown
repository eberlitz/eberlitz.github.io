---
layout: post
comments: true
title:  "[Resolved] Move shelveset to a different branch in TFS"
excerpt: "How to move a shelvset from one branch to another"
date:   2016-09-14 12:00:00
published:   true
---


After making a lot of changes in a branch, and due to an internal policy I had to change the branch to which I should check-in those changes. To not manually do this, I found a way to pass a shelveset to another branch using a tool.

If you have a similar situation. You can perform the following steps:

1. First, you must **install the extension** ["Microsoft Visual Studio Team Foundation Server 2015 Power Tools"](https://visualstudiogallery.msdn.microsoft.com/898a828a-af00-42c6-bbb2-530dc7b8f2e1).
2. Once installed, **open the "VS2013 x64 Cross Tools Command Prompt"** which is located in the following path:
  ```bash
  C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\Shortcuts
  ```
3. With the "Command Prompt" open. Access any TFS mapped folder and run the following command:
  ```bash
  tfpt unshelve /migrate /source:"$/ProjectName/Branch" /target:"$/ProjectName/Targetbranch" "My Name Shelveset"
  ```
4. Once this is done a dialog box will appear and just follow options to the end.

That's it!  :)

