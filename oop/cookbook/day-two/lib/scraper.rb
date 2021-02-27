require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Scraper

  def initialize(keyword)
    @keyword    =   keyword
  end

  def call
    url = "https://www.allrecipes.com/search/results/?sort=re&wt=#{@keyword}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file, nil, "utf-8")

    import_recipes = html_doc.search('.fixed-recipe-card').first(5).map do |recipe_card|
      name = recipe_card.search('.fixed-recipe-card__title-link').first.text.strip
      desc = recipe_card.search('.fixed-recipe-card__description').first.text
      rating = recipe_card.search('.stars').first.attribute("data-ratingstars").value.to_f.round(2)
      href_recipe = recipe_card.search('.fixed-recipe-card__h3').first.children[1].attribute('href').value
      href_recipe_open = open(href_recipe).read
      href_nokogiri = Nokogiri::HTML(href_recipe_open, nil, "utf-8")
      prep_time = href_nokogiri.search('.recipe-meta-item-body').first.text.strip

      Recipe.new(
        name: name,
        description: desc,
        rating: rating,
        prep_time: prep_time
      )
    end
  end
end
