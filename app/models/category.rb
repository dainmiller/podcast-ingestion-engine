class Category < ApplicationRecord
  has_many :shows

  def self.save_from parsed_feed
    Category.create! title: parsed_feed.itunes_categories.first
  end
end
