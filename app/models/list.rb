class List < ActiveRecord::Base  
  attr_accessible :author, :name
  has_many :sublists, :dependent => :destroy
end
