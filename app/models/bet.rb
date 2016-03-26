class Bet < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  validate :user_cannot_bet_on_self

  def user_cannot_bet_on_self
    if goal.user == user
      errors.add(:user, " cannot bet on self!")
    end
  end
end