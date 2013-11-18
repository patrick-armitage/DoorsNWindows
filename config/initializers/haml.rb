require 'rdiscount'

module Doorsnwindows
  module Haml::Filters
  	remove_filter("Markdown")
    module Markdown
      include Haml::Filters::Base

      def render(text)
      	# Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true)).render(text)
        ::RDiscount.new(text, :filter_html).to_html
      end
    end
  end
end