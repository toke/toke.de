---
tags:
  - "git"
  - "note"
categories:
  - "notes"
date: "2015-05-09T15:30:55+01:00"
title: "Shortening a git rev"
slug: short-git-rev
aliases:
- /note/short-git-rev/
---

Note to self: how to get a shorted git rev.

```bash
REV=$(git rev-parse HEAD)
echo ${REV::7}
```

or the correct way ;-) :

```
git rev-parse --short HEAD
```
