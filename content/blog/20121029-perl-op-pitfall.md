---
categories:
- code
date: 2012-10-29T00:00:00Z
tags:
- perl
- operator
- tipp
- pitfall
title: Perl Operator pitfalls
slug: perl-operator-pitfalls
aliases:
- /blog/2012/10/29/perl-op-pitfall/
- /blog/perl/2012/10/29/perl-op-pitfall/
- /blog/2012/10/perl-op-pitfall/
---

Be sure to get familar with the difference between || and // in perl code.


```perl
my $value = do_something() || 1;
```

What's wrong with this? Possibly nothing, maybe everything.

Let's assume something different:

```perl
sub my_sub {
    my $value = shift || 1;
    return $value + 1;
}

print my_sub();
print my_sub(0);
print my_sub(1);
```

So let's guess what is the output of this?

If you are suprised to get three times the same result "2" here is what you
possibly wanted:

```perl
sub my_sub {
     my $value = shift // 1;
     return $value + 1;
}
```

The reason for this behaviour is that perl evaluates only three things as
false in boolean context:

* `0 or '0'`
* Empty values as <code>""</code> or <code>()</code>
* <code>undef</code>

And as || actually is an *or* with other precedence it will evaluate everything
in boolean context. What you realy want is an `if undef` like operator. And
exactly this does the `//` operator above.

See [man perlop](http://perldoc.perl.org/perlop.html) for details.
