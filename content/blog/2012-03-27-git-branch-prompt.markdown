---
date: 2012-03-27T00:00:00Z
tags:
- git
- bash
- unix
- linux
- tipps
title: Git Branch in bash prompt
url: /blog/2012/03/git-branch-prompt/
alias: /blog/2012/03/27/git-branch-prompt/
---

My Bash prompt is something like this `archimedes:toke.de(master) toke$`.
Where `archimedes` is the hostname, `toke.de` the directory within
an git checkout, `master` the actual branch and `toke` my username.
To get this result set this `PS1` in your `.bashrc`:

    ## Add Git-Branch
    PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
