class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :language, presence: true
  validates :subject, presence: true
  validates :pages, presence: true
  # [...]
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :author, :subject ],
    associated_against: {
      user: [ :address, :user_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
