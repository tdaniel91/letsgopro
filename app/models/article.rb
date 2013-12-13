class Article < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :attachment, :default_url => "/images/default.png"	
 
end
