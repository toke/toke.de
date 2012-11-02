---
title: "Perl boolean context"
layout: post
categories: [blog, perl]
tags: [perl, tipp]
---

# Perl boolean context

In the last Post I had written about [Perl Operator pitfalls](http://toke.de/blog/perl/2012/10/29/perl-op-pitfall/).

It is by far not complete but I want to skim over a different topic today.
As we know *0* or *'0'* evaluates to false in boolean context.
Sometimes this may lead to problems. If your sub returns an count of processed objects
it may be possible to assume that 0 processed Objects are an error case. But either
you or your caller has to handle the 0-case special if this is not expected. The safest
way for your caller is to check if you return a defined value or not.

The caller has to check like `ìf (defined $value){}` or as mentioned in my previous post
the difference between: `get_fish() || print "Thank you!` vs. `process_queue() // die "Something wrong here."`
(assuming both of them are returning undef or an int).
An empty queue may be not an error state so an return value of *0* should be safe. But
saying "thank you" for not getting fish may be sarcastical. So here the client has to
choose.

DBI's execute is returning *0E0* for non-"SELECT"-statements instead of 0, other perl libraries
are using different values instead of 0. "fcntl" and "ioctl" are returning the string
*"0 but true"* instead of 0. This string has special handling within perl itself. It does
not raise a warning when using it in integer context. But not handling this value on caller side
may also get you in trouble.

So keep in mind to handle the *defined false values* (0, "0", "" and ()) correct.

Best thing to do:

 * Check always for defined
 * Mind the "defined false values"
 * Also check your while conditions etc.
 * Think about returning "0E0", "00" or "0 but true"


