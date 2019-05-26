class Episode < ApplicationRecord
  belongs_to :show
  has_many :guests
end
