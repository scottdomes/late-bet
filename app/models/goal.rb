class Goal < ActiveRecord::Base

  has_many :bets

  belongs_to :user

  validates :title, presence: true

  validates :deadline, presence: true

  #could also validate with JavaScript
  validate :deadline_date_cannot_be_in_the_past, if: :deadline

  def deadline_date_cannot_be_in_the_past
    if deadline < Date.today
      errors.add(:deadline, "Dates can't be in the past.")
    end
  end    

end