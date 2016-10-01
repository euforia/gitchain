Gitchain (revival-attempt)
==========================
Decentralized P2P Git Network using a private blockchain.

[![Build Status](https://secure.travis-ci.org/gitchain/gitchain.png)](http://travis-ci.org/gitchain/gitchain)


To quote from git's own description:

> Git is a free and open source distributed version control system designed to handle everything
> from small to very large projects with speed and efficiency.

Gitchain is an application of ideas behind Bitcoin, Namecoin and DHT applied to Git hosting. Once you install it, it acts as a local proxy to the entire Gitchain P2P network.

[Support the project on Kickstarter](https://www.kickstarter.com/projects/612530753/gitchain)

Build
-----

Make sure you have atleast go1.6.3 installed

```shell
$ make prepare # (only first time or whenever Godeps file is updated)
$ make
```

Run
---

Start the server using the provided test config:

```shell
$ gitchain --config testdata/1.config server
```

Usage
-----

1. Create keypair

	gitchain keypair-generate testkey

2. Create repository

	- Create name reservation

		gitchain name-reservation testkey test-repo

	- Create name allocation

		gitchain name-allocation testkey test-repo <random_number_from_above_cmd>