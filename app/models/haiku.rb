class Haiku < ActiveRecord::Base
  belongs_to :mood
  belongs_to :user
end