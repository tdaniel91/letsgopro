class Enterprise < ActiveRecord::Base
  has_many :job
  
  has_attached_file :attachment	
end
