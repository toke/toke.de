---
thumbnail: ""
tags:
  - "git"
categories:
  - "notes"
date: "2015-05-09T15:30:55+01:00"
title: "Shorting a Git-REV"
---

Note to self: how to get a shorted git rev.

```
REV=$(git rev-parse HEAD)
echo ${REV::7}
```

or the correct way ;-) :

```
git rev-parse --short HEAD
```
