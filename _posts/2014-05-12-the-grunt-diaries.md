---
layout: post
title:  "The Grunt Diaries"
date:   2014-05-12 16:39:39
categories: Grunt
noindex: false
updated: 2014-05-12
---

We had our nifty difty ruby script in travis for continuous integration. It did it's job very well, we must say, but it was very slow. It was not slow due the inner nature of Ruby, it was slow because it needed a lot of dependencies for everything, if the build needed like 3 minutes to complete, it spend another 5 or more minutes to install everything it needed, so, yeah, 10 minutes finishing the build it's something really not desirable.

In those days Pragmatic Programmer had a very cool coupon with 50% of discount in their books, one of those was 'Automating With Grunt'. Putting this in perspective, Grunt is to Node.js what Rake is to Ruby, I've used rake in different projects, but I've never used Node before, I only knew that Bootstrap used it on their repo.

On this last week, I had the task to learn by heart the book, much to my surprise, it's very intuitive, and a lot alike to Rake, it also divides everything in tasks and it's a lot, but a lot faster than Ruby, since it has a lot less dependencies. Stay tuned for how we will change the 