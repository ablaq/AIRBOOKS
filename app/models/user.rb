class User < ApplicationRecord
  has_many :books
  has_many :books, through: :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true
  validates :address, presence: true

end
