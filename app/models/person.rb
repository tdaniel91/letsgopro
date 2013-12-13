class Person < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, :default_url => "/images/default.png"
  
  def self.search(search)
	if search
		find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	else
		find(:all)
	end
  end
end
