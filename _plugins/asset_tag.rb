module Jekyll
  class AssetTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    # The time stamp when rendered
    def render(context)
      "#{Time.now.to_i}"
    end
  end
end

Liquid::Template.register_tag('asset_tag', Jekyll::AssetTag)