class Sentence < ActiveRecord::Base
  attr_accessible :content, :user_id, :word_id

  validates :content, :word_id, presence: true

  belongs_to :word
end
