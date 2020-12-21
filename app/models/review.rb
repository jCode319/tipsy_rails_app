class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail_bar


# def self.rating(float)
#         case float
#         when 1..1.5
#             "*"
#         when 2..2.5
#             "**"
#         when 3..3.5
#             "***"
#         when 4..4.5
#             "****"
#         when 5..5.5
#             "*****"
#         end
#     end

  end
