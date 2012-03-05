---
layout: post
category: blog
title: "Unix permission pitfalls #1"
tags:
- unix
- root
- permission
- pitfall
---

# Unix permission pitfalls #1
Let's do an experiment:

    $ mkdir test
    $ cd test
    $ mkdir abc
    $ sudo chown -R root:root abc
    $ ls -lsa abc
    total 8
    4 drwxr-xr-x  2 root   root   4096 2012-03-05 10:03 .
    4 drwxr-xr-x 10 user   user   4096 2012-03-05 10:03 ..

Ok, that's clear we created an empty directory and changed the 
ownership to root. Now to something destructive:

    $ rm -rf abc
    $ ls abc
    ls: cannot access abc: No such file or directory

Hoops? Why could the user delete this directory?

## Explanation

The reason we can delete root owned files and (empty) directories
in our case is because the _write_ of our delete is done in our
freshly created directory "test" - which is owned - **by us**. You can
think of an unix directory like an special file which contains the
directory information of the containing elements. **If we can write
to the containing directory we can delete its contents.**

