class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :name, :avatar
  has_attached_file :avatar,
                    #:storage => :s3,
                    #:s3_permissions => :public,
                    #:s3_credentials => "#{Rails.root}/config/s3.yml",
                    :styles => { :thumb => "100x100#" },
                    :default_url => "user-male-2.jpg"

  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: true, on: :create
  validates :name, :email, presence: true

  validates_attachment :avatar, :content_type => { content_type: /\Aimage\/.*\Z/ },
                                :size => { :in => 0..2.megabytes }

  has_many :words
  after_create :send_welcome_email, :create_example_words
end

def send_welcome_email
	UserMailer.welcome_email(self).deliver
end

def create_example_words
	Word.create( name: 'banana',
				 user_id: self.id,
				 word_type: 'noun',
				 sentences_attributes: {"0"=>{"content"=>"A monkey robbed me of my banana"}})
end
