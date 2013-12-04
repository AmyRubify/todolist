class Sublist < ActiveRecord::Base
  attr_accessible :name, :parentlist
  belongs_to :list
end
