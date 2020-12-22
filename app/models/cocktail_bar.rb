class CocktailBar < ApplicationRecord
  validates :name, :address, :rating, :yelp_url, :image_url, :phone_number, presence: true

  has_many :reviwed_users, through: :reviews, foreign_key: :user_id
  has_many :reviews
  has_many :faved_users, through: :favs, foreign_key: :user_id
  has_many :favs
  belongs_to :search

  def self.yelp_search_result(query, search)
    begin
      response = RestClient::Request.execute(
        method: "GET",
        url: "https://api.yelp.com/v3/businesses/search?term=bar&location=#{query}",
        headers: { Authorization: "Bearer #{ENV["YELP_API_KEY"]}" }
        )
        results = JSON.parse(response)
      rescue RestClient::Exception => e
          return "error"
      end
        cocktail_bars = results["businesses"]
        create_bar_from_yelp_results(cocktail_bars, search)
  end

  def self.create_bar_from_yelp_results(results, search)
    results.each do |info|
      address = info["location"]["display_address"].join(" ")
      search.cocktail_bars << CocktailBar.where(address: address).first_or_create do |cb|
        cb.name = info["name"].empty? ? "No name" : info["name"]
        cb.phone_number = info["display_phone"].empty? ? "Unknown phone number." : info["display_phone"]
        cb.rating = info["rating"] ? info["rating"] : 0
        cb.image_url = info["image_url"].empty? ? "No image" : info["image_url"]
        cb.yelp_url = info["url"].empty? ? "https://yelp.com" : info["url"]
      end
    end
  end

end

#geo coder gem
#load response w/ results
#query yelp again
#custom route for favs and reviews...with id to be retrievable
#store the info in the form
# make instance of bar and reference the bar id when I want to retrieve info.
