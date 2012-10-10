---
title: "git svn cleanup"
layout: post
categories: [blog]
tags: [git, svn, scm, tipp]
---

# Cleaning up svn history in git

I was importing svn repositories into git. Once in the past
there was a accidential commit of compiled files and a caching
directory (target and .metadata). Since these where quite
large and are messing up the history I wanted to remove them.
I did it this way:

     git filter-branch -f --index-filter \
         'git rm --cached --ignore-unmatch */target/*' \
         --prune-empty -- --all
     git filter-branch -f --index-filter \
         'git rm --cached --ignore-unmatch .metadata' \ 
         --prune-empty -- --all
     rm -rf .git/refs/original/
     git reflog expire --expire=now --all
     git gc --prune=now
     git gc --aggressive --prune=now
     git push origin master --force

After these steps the repository shrunk from 277MB to 24MB!


