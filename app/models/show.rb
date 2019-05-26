class Show < ApplicationRecord
  belongs_to :network
  has_many :episodes
end
