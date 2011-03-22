module Jekyll
  class CategoryGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      #puts "Categories: #{site.config.inspect}"
      #puts "Music: #{site.categories.first.inspect}"
      site.categories.each do |cat|
        cat_name = cat.first
        posts = cat.last
        # 
        # filename = File.join(site.config['destination'], "#{cat_name}.html")
        # puts "Filename: #{filename}"
        # File.open(filename, 'w') do |f|
        #   f.write("Contentn for #{cat_name}")
        # end


        # puts "#{cat_name.to_s}"
        #         posts.each do |p|
        #           puts "  #{p.data['title']}"
        #         end
      end
    end

  end
end