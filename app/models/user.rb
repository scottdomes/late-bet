class User < ActiveRecord::Base
  has_many :goals, dependent: :destroy
  has_many :bets, dependent: :destroy
end