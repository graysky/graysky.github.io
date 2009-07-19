--- 
wordpress_id: 721
title: Translator - Rails i18n Simplifier
wordpress_url: http://graysky.org/?p=721
layout: post
---
Internationalization (<a href="http://en.wikipedia.org/wiki/Internationalization">i18n</a>) is one of those potentially necessary but not exactly thrilling tasks, so it is best when it is as simple as possible (related: I gave a <a href="/2009/03/rails-internationalization-bostonrb/">recent talk at the Boston Ruby group on Rails i18n</a>.) To that end I've made <a href="http://github.com/graysky/translator/">Translator</a>, a Rails plugin to simplify the i18n process. It is an extraction from what we've learned as we've been working to internationalize <a href="http://www.snapmylife.com/">our Rails application</a>. 

So what does it do?

<h5>Automatic Scoping, or Keep Your Keys DRY</h5>

The first thing it does is make the process of finding keys in localized bundles easier. The <a href=" http://api.rubyonrails.org/classes/I18n.html">I18n module</a> introduced in Rails 2.2 is a great help but it hasn't (yet) been incorporated in a very <em>Rails-y</em> way. Translator defines a convention for keys that follows a similar layout to a Rails project's <tt>app</tt> folder. The benefit is that the code stays <a href="http://en.wikipedia.org/wiki/Don%27t_repeat_yourself">DRY</a> when fetching localized strings, saving precious typing. (Rails 2.3 recently added some <a href=" http://guides.rubyonrails.org/2_3_release_notes.html#partial-scopingfor-translations">partial scoping for views</a>.) An example, starting with the <tt>en.yml</tt> that contains the strings for a fake blog app:

<pre lang="ruby">
en:
  blog_posts: # controller
    show: # action
      title: "My Awesome Blog Post"
</pre>

The code to fetch the title string in the view is just <tt>t('title')</tt> and Translator determines the implied scoping of <tt>"blog_posts.show"</tt>. It provides the same automatic scoping for mailers, models, controllers and views.

<h5>Testing Help, or The Case of the Missing Key</h5>

When extracting boatloads of strings from view templates, mail templates, flash & validation error messages it is easy to make mistakes. The default handling for for a missing translation in a view is to add a span tag with a "missing translation" error message. A reasonable handling in production, but during development and testing it is better to find any missing translations early. Translator adds a <tt>strict_mode</tt> that will fail any tests that encounter a missing translation, and it can be enabled for manually testing as well. Better to fail fast than find out later there was a typo in a key name.

To help with forgetting to extract strings into locale bundles, Translator adds a <tt>pseudo_translate</tt> mode that will make it obvious which strings did not come from a bundle. In <tt>pseudo_translate</tt> mode every string from a bundle has a marker character prepended and appended to it. This makes it easy to quickly eyeball a page and see if anything isn't surrounded in brackets, like "[My Blog]". Also, this can be useful to see how a layout will look if localized to a more verbose language. German, for example, tends to use something like 30% more characters than English, so you could pad each string with 10 characters and see how the layout looks.

<h5>Graceful Locale Fallback, or No Hablo Espanol Hoy</h5>

Translator adds a simple locale fallback mechanism that will first try the set locale, say <tt>:de</tt>, and if a string isn't found will fallback to the <tt>default_locale</tt> set in I18n (<tt>:en</tt> by default). This can bridge the gap between rolling out new site changes even if all the translations aren't ready for every language. 

<h5>Finally</h5>

We've been using <a href="http://github.com/graysky/translator/">Translator</a> in production so it should be ready for others to use. If you do I'd be interested in feedback and suggestions. The <a href="http://github.com/graysky/translator/">Github page</a> has more detailed examples, <a href="http://graysky.github.com/translator/rdoc/">RDocs</a> and how to get started. 
