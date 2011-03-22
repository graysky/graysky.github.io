module Jekyll
  class EchoTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    # The time stamp when rendered
    def render(context)
      @text
    end
  end
end

Liquid::Template.register_tag('echo_tag', Jekyll::EchoTag)