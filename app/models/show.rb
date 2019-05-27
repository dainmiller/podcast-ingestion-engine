class Show < ApplicationRecord
  belongs_to :network, optional: true
  belongs_to :category, optional: true
  has_many :episodes

  def self.save_from parsed_feed
    self.find_or_create_by! title: parsed_feed.title
  end
end
