module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, name, data = {})
      self.content = data.delete('content') || ''
      self.data = data
      dir = dir[-1, 1] == '/' ? dir : '/' + dir

      super(site, base, dir, name)

      # Customize the output settings

      self.data['layout'] = "category" # must match layout
      self.data['permalink'] = "#{basename}/"
      self.data['title'] = "#{basename.capitalize} Posts"
      self.data['category'] = basename
    end

    def read_yaml(base, name)
      # No-op
    end
  end

  class CategoryGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      site.categories.each do |cat, posts|
        site.pages << CategoryPage.new(site, site.source, "category", "#{cat}.html", {'posts' => posts})
      end
    end

  end
end