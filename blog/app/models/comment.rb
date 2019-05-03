class Comment < ApplicationRecord
  validates :username,presence: true, length:{minimum: 2}
  belongs_to :post
end
