module Jekyll
  class ExcerptTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
      puts "Tokens are: #{tokens}"
    end

    # A safe truncate method borrowed from here:
    # 
    def render(context)
      "#{truncate_words(@text)}"
    end
    
    # def awesome_truncate(text, length = 3, truncate_string =  "...")
    #       return "" if text.nil?
    #       l = length - truncate_string.chars.length
    #       text.chars.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
    #     end
    #     
    def truncate_words(text, length = 3, separator = ' ', truncate_string = '...') 
      " " if text.nil? 
      truncated_text = text.split[0..length].join(separator) 
      puts "Original text: [#{text}]"
      puts "Truncated text: [#{truncated_text}]"
      if truncated_text == text.strip
        text 
      else 
        truncated_text + ' ' + truncate_string 
      end
   end
    
  end
end

Liquid::Template.register_tag('excerpt_tag', Jekyll::ExcerptTag)