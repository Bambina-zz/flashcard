class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_attached_file :avatar,
                    :provider => 'AWS',
                    :storage  => :s3,
                    :styles   => { :thumb => '100x100#' },
                    :path     => ':attachment/:id/:style.:extension',
                    :s3_permissions => 'public-read-write',
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :default_url    => 'user-female-2.jpg'

  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: true
  validates :name, :email, presence: true

  validates_attachment :avatar,
                       content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                       size: { :in => 0..2.megabytes }

  has_many :words
  after_create :send_welcome_email, :create_example_words
end

def send_welcome_email
	UserMailer.welcome_email(self).deliver_now
end

def create_example_words
	Word.create( name: 'banana',
				 user_id: self.id,
				 word_type: 'noun',
				 sentences_attributes: {"0"=>{"content"=>"A monkey robbed me of my banana"}})
end
