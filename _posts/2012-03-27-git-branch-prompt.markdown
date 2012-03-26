---
layout: post
title: Git Branch in bash prompt
category: blog
tags: [git, bash, unix, linux, tipps]
---

# Git-Tipp

My Bash prompt is something like this `archimedes:toke.de(master) toke$`.
Where `archimedes` is the hostname, `toke.de` the directory within
an git checkout, `master` the actual branch and `toke` my username.
To get this result set this `PS1` in your `.bashrc`:

    ## Add Git-Branch
    PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
