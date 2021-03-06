module Spree
  class Page < ActiveRecord::Base
    validates :title, :presence => true
    validates :permalink, :uniqueness => true
  
    scope :published, lambda {where(published: true)}

    paginates_per 50
  end
end
