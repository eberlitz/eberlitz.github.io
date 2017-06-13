---
layout: post
comments: true
title:  "Installing an updated version of git on RHEL7"
excerpt: "How to update the outdated git on the Red Hat Enterprise Linux 7"
date:   2017-06-13 10:00:00
published:   true
---

# Installing an updated version of git on RHEL7

Go to this url [https://www.kernel.org/pub/software/scm/git/](https://www.kernel.org/pub/software/scm/git/) and get the name of the latest release.

Install dependencies:

```sh
yum check-updates
sudo yum install xmlto asciidoc curl-devel expat-devel gettext-devel openssl-devel zlib-devel
```

Get the git source:

```sh
mkdir git
cd git
curl https://www.kernel.org/pub/software/scm/git/git-2.9.4.tar.gz | tar xz --strip-components=1
```

**Note**: change the version in the url with the one you want to install.

Compile and install it:

```sh
./configure
make all doc
sudo make prefix=/usr/local install install-doc
```

Also, if you want, you can enable colors for the git terminal output:

```sh
git config --global color.ui true
```
