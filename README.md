# Hello

This is the code behind my website graysky.org

## TODO

- "about.me" style front page
-- snippets from recent posts
-- projects / github
-- photo of me or styled photo background?
-- different font?
--- http://www.google.com/webfonts?subset=latin&sort=added
-- Couple that I like as a model:
--- http://about.me/alexis

- Put posts into categories and have category indexes
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



- Fix code syntax highlighting (syntax highlighter from google code?)

## Locally

Run like: jekyll --server --auto --limit_posts 10
