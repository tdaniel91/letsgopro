class Person < ActiveRecord::Base
  belongs_to :user
  has_many :ability
  has_many :article
  has_many :contact
  has_many :course
  has_many :job
  has_attached_file :avatar
  

end
