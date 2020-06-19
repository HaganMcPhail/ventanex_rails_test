class PayAccount < ActiveRecord::Base
  validates :nickname, :account_type, :account_number, presence: :true
  validates :account_number, numericality: true, uniqueness: true, length: { minimum: 6 }
  validates :nickname, uniqueness: true

  enum account_type: {bank_account:  1, debit_card: 2}
end
