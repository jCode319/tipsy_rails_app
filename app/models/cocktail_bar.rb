class CocktailBar < ApplicationRecord
  has_many :reviwed_users, through: :reviews, foreign_key: :user_id
  has_many :reviews
  has_many :faved_users, through: :favs, foreign_key: :user_id
  has_many :favs

  def self.yelp_search_result
      response = RestClient::Request.execute(
        method: "GET",
        url: "https://api.yelp.com/v3/businesses/search?term=bar}&location=washingtondc",
        headers: { Authorization: "Bearer #{ENV["YELP_API_KEY"]}" }
        )
        results = JSON.parse(response)
        cocktail_bars = results["businesses"]
        # create_bar_from_yelp(results)
  end

  # def self.create_bar_from_yelp(results)
  #   results.each do |info|
  #     cocktail_bar = CocktailBar.find_or_create_by() do |c|
  #       c.name = info["name"]
  #       c.address = info["location"]["display_address"].join(" ")
  #       c.phone_number = info["display_phone"]
  #       c.image_url = info["image_url"]
  #       c.biz_url = info["url"]
  #     end
  #   end
  # end

end

#geo coder gem
#load response w/ results
#query yelp again
#custom route for favs and reviews...with id to be retrievable
#store the info in the form
# make instance of bar and reference the bar id when I want to retrieve info.
