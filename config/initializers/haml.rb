require 'rdiscount'

module Doorsnwindows
  module Haml::Filters
  	remove_filter("Markdown")
    module Markdown
      include Haml::Filters::Base

      def render(text)
        ::RDiscount.new(text, :filter_html).to_html
      end
    end
  end
end