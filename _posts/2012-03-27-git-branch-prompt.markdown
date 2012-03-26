---
title: Git Branch in bash prompt
category: blog
tags:
- git
- bash
- unix
- tipps
---

# Git-Tipp

My Bash prompt is something like this `archimedes:toke.de(master) toke$`.
To get this result set this `PS1` in your `.bashrc`:

    ## Add Git-Branch
    PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
