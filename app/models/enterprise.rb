class Enterprise < ActiveRecord::Base
  has_many :job
  belongs_to :user

  has_attached_file :attachment, :default_url => "/images/default.png"
end
