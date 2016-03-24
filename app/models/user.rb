class User < ActiveRecord::Base

  has_many :bets

  has_many :goals

  validates :name, presence: true

end