class Word < ActiveRecord::Base
  validates :word_type, :length => { maximum: 30 }
  validates :name, :word_type, :user_id, presence: true
  validates :name, uniqueness: {scope: :user_id}

  belongs_to :user
  has_many :sentences
  accepts_nested_attributes_for :sentences
end
