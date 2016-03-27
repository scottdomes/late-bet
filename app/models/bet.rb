class Bet < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  validate :user_cannot_bet_on_self
  validate :user_cannot_make_same_bet_twice, :on => :create

  after_create :add_bet_notification

  def user_cannot_make_same_bet_twice
    unless goal.bets.where(user_id: user.id).empty?
      errors.add(:user, "cannot make same bet twice")
    end
  end

  def user_cannot_bet_on_self
    if goal.user == user
      errors.add(:user, " cannot bet on self!")
    end
  end

  def add_bet_notification
    goal.user.notifications.create(
      other_user_id: user.id, 
      content: "#{user.first_name} bet on your goal to #{goal.title}!"
    )
    goal.user.save
  end

end