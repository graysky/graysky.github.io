require 'erb'

module Jekyll
  class ErbTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    # Make an ERB template of the text and process it
    def render(context)
      ERB.new(@text).result(binding)
    end
  end
end

Liquid::Template.register_tag('erb_tag', Jekyll::ErbTag)