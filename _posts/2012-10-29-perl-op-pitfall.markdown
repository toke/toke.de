---
title: "Perl Operator pitfalls"
layout: post
categories: [blog, perl]
tags: [perl, operator, tipp]
---

# Perl operator pitfalls

Be sure to get familar with the difference between || and // in perl code.

{% highlight perl %}

    my $value = do_something() || 1;

{% endhighlight %}

What's wrong with this? Possibly nothing, maybe everything.

Let's assume something different:

{% highlight perl %}

    sub my_sub {
        my $value = shift || 1;
        return $value + 1;
    }

    print my_sub();
    print my_sub(0);
    print my_sub(1);

{% endhighlight %}

So let's guess what is the output of this?

If you are suprised to get three times the same result "2" here is what you
possibly wanted:

{% highlight perl %}

    sub my_sub {
         my $value = shift // 1;
         return $value + 1;
    }

{% endhighlight %}

The reason for this behaviour is that perl evaluates only three things as 
false in boolean context:

<ul>
<li><code>0 or '0'</code></li>
<li>Empty values as <code>""</code> or <code>()</code></li>
<li><code>undef</code></li>
</ul>

And as || actually is an *or* with other precedence it will evaluate everything
in boolean context. What you realy want is an `if undef` like operator. And
exactly this does the `//` operator above.

See [man perlop](http://perldoc.perl.org/perlop.html) for details.
