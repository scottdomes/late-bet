class Bet < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  validate :user_cannot_bet_on_self
  validates_uniqueness_of :user_id, :message => " cannot make same bet twice"

  after_create :add_bet_notification

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