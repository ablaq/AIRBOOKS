class Rental < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :status, presence: true
  validates :status, inclusion: { in: ["Pending", "Rejected", "Accepted"]}
  validate :expiration_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date =< Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end
