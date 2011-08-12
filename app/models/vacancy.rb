class Vacancy < ActiveRecord::Base
  attr_accessible :title, :text
  
  belongs_to :user
  
  validates :title, :presence => true, :length => { :maximum => 100 }
  validates :text, :presence => true
end
