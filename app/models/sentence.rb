class Sentence < ActiveRecord::Base
  attr_accessible :content, :user_id, :word_id
  belongs_to :word
end
