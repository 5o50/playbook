# Technical SEO
The process of optimizing your website to help search engines find, understand, and index your pages.

### Why is it important ?
If search engines can't properly read or index your pages, it won't rank for any keywords

### Best Practices

**Site structure**
The way you organize content on your site
You want to make sure you organize it in a logical way
This helps both search engines and users to navigate and understand your site better

**Ensure your pages don't load slow**
Cache you website's content
Compress your images => Shortpixel.com

**Monitor SEO errors**
Check for broken pages, 404 error pages, duplicate content issues, and improper redirects
use SEOChecker.io

### THINGS TO AVOID THIS AND ENSURE YOUR SITE IS FOUND ONLINE

**noindex Meta Tag**
<meta name="robots" content="noindex" />
If you dont want to be indexed by search engines
You can use SEO Minion to check this

**robots.txt file**
A file with a URL that looks like
`youwebsite.com/robots.txt`

If you're site is not getting indexed for any reason
and you're trying to troubleshoot it
this file is what you should be looking at first
This file tells online crawlers if it can crawl this site
and what part it is allowed to crawl or not.

- User-Agent: directive tell the crawler that the rules apply to
- Disallow: directive tell the crawler what part of the site it is not allowed to crawl
- Sitemap: directive tell the crawler where the sitemap is

**Sitemap**
XML files that list the important URLs on your website

It looks like this: `youwebsite.com/sitemap.xml`
It list all of your website content, use a plugin to generate it

**Redirects**
A redirect takes a visitor and bots from one URL to another.
Purpose is to structure, organize, and consolidate pages.

`youwebsite.com/running-shoes-2024` -> `youwebsite.com/running-shoes`
If both have the same you content, you can redirect one to the other

**Canonical Tag**
This tag tells search engines which URL is the original version of the content
Its like a redirect only for search engines
This help prevent any duplicate content issues on your site

<link rel="canonical" href="https://www.yourwebsite.com/red-shirt" />

Two duplicate pages with different URLs

https://www.yourwebsite.com/red-shirt-rb74391
https://www.yourwebsite.com/red-shirt

You can view this with SEO Minion
