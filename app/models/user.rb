class User < ActiveRecord::Base

  has_many :bets

  has_many :goals

  validates :username, presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

end