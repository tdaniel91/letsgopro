class Article < ActiveRecord::Base
Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.8.7-Q16'
  belongs_to :user
  
  has_attached_file :attachment, 
  :styles => {
		:thumb => "150x150",
		:profile => "200x200"
  }, :default_url => "/images/default.png"	
 
	searchable do
	text :article_title
	end	
end
