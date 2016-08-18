class User < ActiveRecord::Base
  has_secure_password
  has_many :moods 
  has_many :haikus, through: :moods
end
