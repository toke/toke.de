---
layout: default
title: Thomas 'Toke' Kerpe
---

## about me

Online ego of an coder, original throws shadow when light is on.  

I'm a software developer currently located in Karlsruhe (Germany).
Most of my work is web, large dataset and database related.
I'm a data geek.

I love [Python](http://www.python.org), [Perl](/perl/),
[CouchDB](http://couchdb.apache.org), [Android](http://www.android.com)
and other cool technologies… and of course Coffee!

## latest blog posts

  <ul class="posts">
    {% for post in site.categories.blog limit:4 %}
      <li><time datetime="{{ post.date| date: "%Y-%m-%d" }}">{{ post.date | date_to_string }}</time> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    {% if site.categories.blog.size > 4 %}
      <li><a href="/blog/">more…</a></li>
    {% endif %}
  </ul>

## articles

 * [Grundlagen: was passiert beim "surfen"?](/artikel/grundlagen/was-passiert-beim-surfen/) (german)
 * [Kernel unter Debian kompilieren](/artikel/linux/debian-kernel-bauen/) (german, -2008)

## good reads

Starting to collect recent good reads:

 * [Javascript the good parts](http://javascript.crockford.com/) - [Douglas Crockford](http://crockford.com/)
 * Fermats letzter Satz ([Fermat's last theorem](http://www.simonsingh.net/books/fermats-last-theorem/the-book/) - [Simon Singh](http://www.simonsingh.net/))
 * Goedel Escher Bach - [Douglas Hofstadter](http://www.cogs.indiana.edu/people/homepages/hofstadter.html)

## contact

 * E-Mail: [web@toke.de](mailto:web@toke.de)
 * PGP-Key: [9CAA5862](9CAA5862.asc) valid from 13.08.2013
 * [XING-Profile](https://www.xing.com/profile/Thomas_Kerpe)
 * [GitHub-Profile](https://github.com/toke)
 * [Hidden-Site-Version](https://ptusz6326ongoogf.onion/)
