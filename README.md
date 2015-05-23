FreeSWITCH helper scripts
=========================

This is a collection of scripts which can be used with FreeSWITCH servers.


Installing the ESL module for Perl
----------------------------------

ESL client library is not available in a package, so we get the whole
source and build only the Perl module

```
apt-get install -y autoconf automake devscripts gawk g++ git-core \
 libjpeg-dev libncurses5-dev libtool make python-dev gawk pkg-config \
 libtiff5-dev libperl-dev libgdbm-dev libdb-dev gettext libssl-dev \
 libcurl4-openssl-dev libpcre3-dev libspeex-dev libspeexdsp-dev \
 libsqlite3-dev libedit-dev libldns-dev libpq-dev \
 libxml2-dev libpcre3-dev libcurl4-openssl-dev libgmp3-dev libaspell-dev\
 python-dev php5-dev libonig-dev libqdbm-dev libedit-dev


cd /usr/src
git clone -b v1.4 https://freeswitch.org/stash/scm/fs/freeswitch.git
cd /usr/src/freeswitch
./bootstrap.sh -j
./configure 
cd /usr/src/freeswitch/libs/esl
make
make perlmod-install
```



Author and License
------------------
Copyright (c) 2015 Stanislav Sinyagin <ssinyagin@k-open.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.