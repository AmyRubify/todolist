class List < ActiveRecord::Base  
  attr_accessible :author, :name, :sublists_attributes
  has_many :sublists, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :sublists
  
  def count_sublists_not_completed
    self.sublists.where("status =  ?", false).count
  end  
end
