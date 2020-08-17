class Rental < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :status, presence: true
  validates :status, inclusion: { in: ["Pending", "Rejected", "accepted"]}
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
