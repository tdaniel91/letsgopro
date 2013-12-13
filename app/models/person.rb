class Person < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, :default_url => "/images/default.png"
end
