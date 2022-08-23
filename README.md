# inform-website
The home page for the Inform website.

This repository serves the home page `inform7.com` for
the [Inform programming language](https://github.com/ganelson/inform), using GitHub pages.
The site is very simple, containing only a copy of the current documentation,
a few news items, and a collection of links to other resources.

At present, the domain name `inform7.com` simply redirects to the GitHub Pages
URL for this repository, that is, `https://ganelson.github.io/inform-website/`.
At some point the DNS records for the domain name may move it here permanently
so that no redirection is needed.

## How to update the site

Content in the `docs` is automatically run through the Jekyll static website maker:
see the relevant [GitHub documentation](https://docs.github.com/en/pages). Roughly
speaking, Markdown is converted to HTML, certain braced variables like `{{ site.baseurl }}`
are replaced by their values, and blog posts in the [docs/_posts](docs/_posts)
directory are arranged nicely, with filenames such as:

	2022-07-31-narrascope-iii.markdown

becoming the URL:

	talks/2022/07/31/narrascope-iii.html

Note that the site metadata file `docs/_config.yml` is not converted and has a
special meaning to Jekyll: it's short and to the point, and unlikely to need
alteration.

Binaries of old copies of the Inform apps are not stored on this server because
they would balloon the repository to about 1.4 GB. Instead, they're currently
housed at `emshort.com/inform-app-archive`. In due course they may move.
Because they correspond to versions of Inform before it was tracked by Git,
they can't be made "releases" in the GitHub sense.

### How to add new pages

Adding a file `docs/whatever.md` would create a new top-level page, which
would then automatically be part of the navigation menu. Though otherwise
written in Markdown, this is expected to contain a few lines of Jekyll
instructions at the top. This would do it:

	---
	layout: page
	title: Whatever
	permalink: /whatever/
	---

### How to add new blog items

Creating a file `docs/_posts/YYYY-MM-DD-short-url-here.md` adds a blog post.
This too should open with some Jekyll incantation:

	---
	layout: post
	title:  "Title of the blog post here"
	date:   YYYY-MM-DD 15:30:00 +0600
	categories: talks
	---

Any categories can be used. Note that the `YYYY-MM-DD` date in this header
should match the one in the filename. The time of day is irrelevant for a
low-traffic blog like this one.

### How to update the Inform documentation served here

The path `docs/book` contains a complete HTML copy of the Inform in-app
manuals "Writing with Inform" and "The Inform Recipe Book". This is all
processed by Jekyll to become the actual site, but in practice the files are
all literal HTML or CSS and they pass through Jekyll unchanged.

To update this, clone the repository so that it sits beside the `inform`
repository. For example, your local copies might look like so:

	work
		inform
		inform-website

The `inform` repository contains the documentation-generating tool `indoc`
and also the source matter for the two manuals. You'll need to build that
first, so that you have a working `indoc`. Then:

	cd inform-website
	make books

and wait for a few seconds.
