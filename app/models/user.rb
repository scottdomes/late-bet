class User < ActiveRecord::Base

  has_many :bets

  has_many :goals

  has_many :notifications

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :username, presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  def bet_results
    results = {winnings: [], debts: []}
    
    bets.each do |bet|
      if bet.goal.fail
        results[:winnings] << bet
      elsif bet.goal.success
        results[:debts] << bet
      end
    end

    goals.each do |goal|
      if goal.success && goal.bets
        goal.bets.each do |bet|
          results[:winnings] << bet
        end
      elsif goal.fail && goal.bets
        goal.bet.each do |bet|
          results[:debts] << bet
        end
      end
    end
    results
  end
end