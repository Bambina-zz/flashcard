class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :name
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :name, :email, :password, :password_confirmation, presence: true
  has_many :words
end
