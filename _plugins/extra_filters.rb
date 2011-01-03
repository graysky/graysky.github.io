require 'nokogiri'

module Jekyll
  module ExtraFilters
    
    # Make an excerpt of the text, length is in words
    def excerpt(text, max_words = 10)
      separator = ' '
      truncate_string = '...'
            
      excerpt_text = ""
      
      x = Nokogiri::HTML(text)
      
      count = 0
      is_overflowed = false
      
      x.css("body").children.each do |node_set|
        
        # Depth first processing
        excerpt_text += process_node_set(node_set)
        
        # Already run out of words, so skip.
        # next if is_overflowed
        # 
        # txt = node.text
        # 
        # # TODO Don't count whitespace
        # txt_length = txt.split.size # count words
        # 
        # #truncated_text = txt.split[0..length].join(separator)
        # 
        # if txt_length > max_words
        #   
        #   puts "Node overflows!"
        #   is_overflowed = true
        #   # Truncate this text
        #   node.text = "TRUNCATED"
        #   
        # else
        #   max_words -= txt_length
        # end
        # 
        # excerpt_text += node.to_s
        
      end
      
      puts "Result is: [#{excerpt_text}]"
      
      #excerpt_text += node.to_s
      excerpt_text
    end
    
  protected
  
  def process_node_set(node_set, result='')
    #puts "Looking at: #{node_set.inspect}"
    return result if node_set.nil? || (node_set.respond_to?(:empty?) && node_set.empty?)
    
    result = process_node_set(node_set.children, result)
    
    node_set.each do |node|
      puts "Node is: #{node.inspect} (#{})"
      if node.respond_to?(:text?) && node.text?
        puts "Text is: #{node.text.to_s}"
        result += node.text.to_s
      end
      
    end
    result
  end
  
  def better_truncate(text, length = 10, separator = ' ', truncate_string = '...')
    truncated_text = text.split[0..length].join(separator) 
    puts "Original text: [#{text}]"
    puts "Truncated text: [#{truncated_text}]"
    if truncated_text == text.strip
      text 
    else 
      truncated_text + ' ' + truncate_string 
    end
  end
  
  def awesome_truncate(text, length = 30, truncate_string = "...")
    return "" if text.nil?
    l = length - truncate_string.length
    text.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
  end
    
  end
end

Liquid::Template.register_filter(Jekyll::ExtraFilters)