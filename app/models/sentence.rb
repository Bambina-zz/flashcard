class Sentence < ActiveRecord::Base

  validates :content, presence: true

  belongs_to :word
end
