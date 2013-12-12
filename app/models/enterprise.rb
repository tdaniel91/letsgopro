class Enterprise < ActiveRecord::Base
  has_many :job
  Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.8.7-Q16'
  belongs_to :user

  has_attached_file :attachment, 
  :styles => {
		:thumb => "150x150",
		:smaller => "100x100",
		:profile => "200x200"
  }, :default_url => "/images/default.png"

 searchable do
 text :name
 end
end
