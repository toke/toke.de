---
date: 2017-04-09T14:04:05+02:00
description: Switched from jeckyll to Hugo
author: "Thomas Kerpe"
tags:
- meta
- hugo
- jekyll
title: Switched to Hugo
lang: en
---

For years this site was generated using Jekyll.
A long time I planned to move to [Hugo](https://gohugo.io) as
I liked the concept and it's ease of use. And finally
I used in other places with success.

Hugo is, as is Jekyll, a static site generator which uses markdown
files as input and applies templates (or complete themes) to it.

So here we go. toke.de is now generated using hugo.

## Other changes

I've wrote <a href="{{<relref "blog/2012-02-09-how-i-post.markdown">}}">in the past</a>
on how the site was generated using github webhooks.
For some time I used [adnanh/webhook](https://github.com/adnanh/webhook)
to accept the webhooks with success, so I only had to modify
my accepting shell script a little bit to call hugo instead of jekyll.

The design of the site is not final and I may tweak it.
Currently it is based on [cocoa-eh hugo theme](http://themes.gohugo.io/cocoa-eh-hugo-theme/).
