class BankAccount < ApplicationRecord
  has_many :user_bank_accounts
  has_many :user, through: :user_bank_accounts
  has_many :statements
end
