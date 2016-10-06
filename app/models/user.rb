class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 32 }
  validates :name, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  # validations: false avoid user entering password twice.
  has_secure_password validations: false
  validates :password, presence: true, on: :create
end
