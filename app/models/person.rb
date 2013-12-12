class Person < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar
  
	searchable do
	text :name
	end
end
