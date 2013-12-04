class User < ActiveRecord::Base
  attr_accessible :name, :password, :username
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
end
