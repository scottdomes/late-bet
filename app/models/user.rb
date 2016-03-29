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
      else
        results[:debts] << bet
      end
    end

    goals.each do |goal|
      if goal.success && goal.bets
        goals.bets.each do |bet|
          results[:winnings] << bet
        end
      elsif goal.fail && goal.bets
        goals.bet.each do |bet|
          results[:debts] << bet
        end
      end
    end
  end

  def winnings
    winnings = []
    bets.each do |bet|
      if bet.goal.fail
        winnings << bet
      end
    end

    goals.each do |goal|
      if goal.success && goal.bets
        goal.bets.each do |bet|
          winnings << bet
        end
      end
    end
    winnings
  end

  def debts
    debts = []
    bets.each do |bet|
      if bet.goal.success == true
        debts << bet
      end
    end

    goals.each do |goal|
      if goal.fail && goal.bets
        goal.bets.each do |bet|
          debts << bet
        end
      end
    end
    debts
  end

end