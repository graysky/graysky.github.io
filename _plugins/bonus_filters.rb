# Monkey patch to add more custom filters
module Jekyll
  module Filters
    
    # Make a snippet of this post
    def snippetize(post_body, limit=200)
      # Look for special snippet
      truncatewords(strip_html(post_body))
      
    end
  end
end
