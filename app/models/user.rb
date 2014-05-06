class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :name

  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :name, :email, :password, :password_confirmation, presence: true

  has_many :words
  after_save :send_welcome_email
end

def send_welcome_email
	UserMailer.welcome_email(self).deliver
end
