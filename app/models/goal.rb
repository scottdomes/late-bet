class Goal < ActiveRecord::Base

  has_many :bets

  belongs_to :user

  validates :title, presence: true, length: {maximum: 40, message: "Limit: 40 characters"}

  validates :stake_item, presence: true, length: {maximum: 40, message: "Limit: 40 characters"}

  validates :stake_qty, numericality: {greater_than_or_equal_to: 1, message: 'number should be greater than 0'}

  validates :deadline, presence: true

  #could also validate with JavaScript
  validate :deadline_date_cannot_be_in_the_past, if: :deadline

  def deadline_date_cannot_be_in_the_past
    if deadline < Date.today
      errors.add(:deadline, "Dates can't be in the past.")
    end
  end    

end