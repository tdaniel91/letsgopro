class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #{attr_accessible :email, :password, :password_confirmation, :remember_me  , :person_id

  has_one :person
  has_many :ability
  has_many :article
  has_many :contact
  has_many :course
  has_many :job
end


