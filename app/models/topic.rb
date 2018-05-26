class Topic < ActiveRecord::Base
     validates :title, :presence => true
     validates :title, :uniqueness => true
     has_many :resources
     belongs_to :user
end
