# encoding: utf-8
module Jekyll
  module CategoryLink
    def CategoryLink(input)
      input = input.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
       "categories/#{input}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::CategoryLink)