class Show < ActiveRecord::Base
  
  # create_table :shows do |t|
  #     t.string   :name
  #     t.string   :network
  #     t.string   :day
  #     t.integer  :rating
  #     t.string   :season
  
  
  def self.highest_rating
    Show.maximum(:rating)    
  end

  def self.most_popular_show
    Show.find_by("rating = ?", highest_rating)
  end
  
  def self.lowest_rating
    Show.minimum(:rating)    
  end

  def self.least_popular_show
    Show.find_by("rating = ?", lowest_rating)
  end

  def self.ratings_sum
    Show.sum(:rating)
  end

  def self.popular_shows
    Show.where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    Show.all.order(:name)
  end

end
