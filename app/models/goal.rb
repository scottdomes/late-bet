class Goal < ActiveRecord::Base

  has_many :bets

  belongs_to :user

  validates :title, presence: true, length: {maximum: 40, message: "Limit: 40 characters"}

  validates :stake_item, presence: true, length: {maximum: 40, message: "Limit: 40 characters"}

  validates :stake_qty, numericality: {greater_than_or_equal_to: 1, message: 'number should be greater than 0'}

  validates :deadline, presence: true

  #could also validate with JavaScript
  validate :deadline_date_cannot_be_in_the_past, if: :deadline

  after_update :add_goal_notification

  def deadline_date_cannot_be_in_the_past
    if deadline < Date.today
      errors.add(:deadline, "Dates can't be in the past.")
    end
  end    

  def add_goal_notification
    if success
      bets.each do |bet|
        bet.user.notifications.create(
          other_user_id: user.id, 
          content: "#{user.first_name} succeeded at their goal to #{title}! You owe #{user.first_name} ${stake_qty} #{stake_item}!"
        )
        bet.user.save
      end
    elsif fail
      bets.each do |bet|
        bet.user.notifications.create(
          other_user_id: user.id, 
          content: "#{user.first_name} failed at their goal to #{title}! You won #{stake_qty} #{stake_item} from #{user.first_name}!"
        )
        bet.user.save
      end
    end
  end

end