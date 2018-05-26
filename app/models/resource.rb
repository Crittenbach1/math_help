class Resource < ActiveRecord::Base
     validates :title, :content, :presence => true
     belongs_to :topic
end
