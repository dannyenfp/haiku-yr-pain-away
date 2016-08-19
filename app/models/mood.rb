class Mood < ActiveRecord::Base
  belongs_to :user
  has_many :haikus

  validates_presence_of :name
end