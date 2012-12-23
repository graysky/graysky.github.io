# Hello

This is the code behind my website graysky.org

## TODO
- Fix Photography page

- "about.me" style front page
	- snippets from recent posts
	- projects / github
	- photo of me or styled photo background?
	- Couple that I like as a model:
		- http://about.me/alexis
- Excerpts for category view and front page
- like:
m = post.match(/<!--SNIPPET-->/)
if post.description
	post.description
eslif m
  strip_html m.pre_match
else
  # just trim after stripping HTML
end

- Find posts without a category:
find .  -type f -exec  grep  -H -E -o -c  "categories"  {} \; | grep :0\$

- Update photo gallery to include Ireland & other photos.
-- Maybe switch to something like: http://www.smashingapps.com/2011/01/07/awesome-jquery-techniques-to-create-visually-impressive-photo-galleries.html

- Fix code syntax highlighting (syntax highlighter from google code?)

## Locally

Run like: jekyll --server --auto --limit_posts 20

## Deploy to s3/cloudfront

Setup following: http://iamnotaprogrammer.com/Jekyll-S3-Cloudfront-Aname-Root.html

./publish.sh
