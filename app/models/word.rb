class Word < ActiveRecord::Base
  attr_accessible :name, :user_id, :word_type, :sentences_attributes
  validates :word_type, :length => { maximum: 30 }

  belongs_to :user

  has_many :sentences
  accepts_nested_attributes_for :sentences
end
