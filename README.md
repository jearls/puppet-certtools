# certtools

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with certtools](#setup)
    * [What certtools affects](#what-certtools-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with certtools](#beginning-with-certtools)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A set of tools for working with certificates and certificate stores.

## Module Description

This puppet module provides a set of defined resource types that allow you to manage NSS certificate stores and the keys and certificates held in those stores.
Only tested on Puppet 4 and RedHat 6.

## Setup

### What certtools affects

The base class installs the required packages - on RedHat, this consists of `nss-tools` and `openssl`.

The `certtools::store` and `certtools::store::cert` types manage a certificate store and the certificates and keys within that store, respectively.  For the directory which contains the store, they (via the `certutil` and `pk12util` commands) create and manage the `cert8.db`, `key3.db`, and `secmod.db` files.

**Warning** - when storing or retrieving keys, the key's password will appear in the command line of the import or export command.

## Usage

The simplest example:

    # make sure the required packages are installed
    include certtools

    # make sure my certificate store is created
    certtools::store { '/etc/openldap/certs':
      ensure => present ,
    }

    # install my CA's intermediate certificates
    certtools::store::cert { 'LDAP intermediate certificate':
      ensure      => present ,
      store       => '/etc/openldap/certs' ,
      certificate => "puppet:///modules/${module_name}/intermediate.crt" ,
      trust       => 'CT' ,
      nickname    => 'intermediate' ,
    }

    certtools::store::cert { 'LDAP server certificate':
      ensure      => present ,
      store       => '/etc/openldap/certs' ,
      certificate => "puppet:///modules/${module_name}/ldap.crt" ,
      key         => '/tmp/ldap.key' , # assumed to be generated elsewhere
      keypass     => 'This1s@$ecre+' , # Dunno how to do this more securely
      keytype     => pem , # defaults to 'pem', can also be 'pkcs12'
      nickname    => 'ldap' ,
    }

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

Only tested on Puppet version 4 running on Enterprise Linux (RHEL/OEL/etc.) 6.

## Development

* Clone the [GitHub repository](https://github.com/jearls/puppet-certtools)
* Create a topic branch for your fix or new feature
* Make your changes
* Add new `spec` tests for your changes
* Ensure the `bundle exec rake spec` tests pass
* Push back to github and open a pull request
