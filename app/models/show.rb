class Show < ApplicationRecord
  belongs_to :network, optional: true
  has_many :episodes
end
