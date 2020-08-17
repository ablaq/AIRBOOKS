class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :language, presence: true
  validates :subject, presence: true
  validates :pages, presence: true

end
