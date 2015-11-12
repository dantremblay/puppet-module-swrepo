# puppet-module-swrepo
===

[![Build Status](https://travis-ci.org/jwennerberg/puppet-module-swrepo.png?branch=master)](https://travis-ci.org/jwennerberg/puppet-module-swrepo)

Puppet module for managing software repositories (yum, zypper, apt)

===

# Compatibility
---------------
This module is built for use with Puppet 3.x and 4.x on the following OS families:

* EL 7
* EL 6
* EL 5
* Suse 11
* Suse 12
* Debian

This module uses the custom types [zypprepo](https://github.com/deadpoint/puppet-zypprepo), [rpmkey](https://github.com/stschulte/puppet-rpmkey) and [aptrepo](https://github.com/jbouse/puppet-aptrepo).

===

# Class parameters
------------------

repotype
--------
Type of repository to configure. Default value depending on OS (yum for RHEL and so on).

- *Default*: 'USE_DEFAULT'

repos
-----
Hash of repositories to configure.

- *Default*: undef

hiera_merge
-----------
Boolean to control merges of all found instances of repositories in Hiera. This is useful for specifying repositories resources at different levels of the hierarchy and having them all included in the catalog.

- *Default*: false

===

# Define swrepo::repo
---------------------

*Parameters*
------------

repotype
--------
Type of repository to configure (yum, zypper, apt)

- *Default*: N/A

baseurl
-------
URL  to the directory where the yum repository 'repodata' directory lives.

- *Default*: N/A

enabled
-------
Either '1' or '0'. This tells yum whether or not use this repository.

- *Default*: '1'

autorefresh
-----------
Note: Suse only

- *Default*: undef

gpgcheck
--------
Either '1' or '0'. This tells yum whether or not it should perform a GPG signature check on the packages gotten from this repository.

- *Default*: undef

gpgkey_source
-------------
URL pointing to the ASCII-armored GPG key file for the repository.

- *Default*: undef

gpgkey_keyid
------------
KeyID for the GPG key to import. 8 char hex key in uppercase.

- *Default*: undef

priority
--------
Priority of this repository from 1-99. Requires that the priorities plugin is installed and enabled.

- *Default*: undef

keeppackages
------------
Note: Suse only.

- *Default*: undef

type
----
Note: Suse/Debian only. For Debian can be 'deb' or 'deb-src'.

- *Default*: undef

descr
-----
A human-readable description of the repository.

- *Default*: undef

exclude
-------
List of shell globs. Matching packages will never be considered in updates or installs for this repo.

- *Default*: undef

proxy
-----
URL to the proxy server that yum should use.

- *Default*: undef

downcase_baseurl
----------------
Boolean to control whether or not `baseurl` should be converted to lowercase.

- *Default*: false

ensure
------
Either 'present' or 'absent'.  Note: Debian only

- *Default*: undef

distribution
------------
Which distribution this repository is for.  Can be either the release code name/alias (wheezy, jessie, stretch, sid) or the release class (oldstable, stable, testing, unstable) respectively.
Note: Debian only

- *Default*: undef

components
----------
Either 'main', 'contrib' or 'non-free'.  See https://wiki.debian.org/SourcesList.
Note: Debian only

- *Default*: undef
