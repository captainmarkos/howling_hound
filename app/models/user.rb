class User < ApplicationRecord
  has_many :user_bank_accounts
  has_many :bank_accounts, through: :user_bank_accounts

  has_many_attached :statement
  has_one_attached :image

  validates :email, uniqueness: true
end
