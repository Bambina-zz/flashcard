class Word < ActiveRecord::Base
  attr_accessible :name, :user_id, :word_type
  validates :word_type, :length => { maximum: 10 }
  belongs_to :user
end
