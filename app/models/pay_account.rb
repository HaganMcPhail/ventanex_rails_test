class PayAccount < ActiveRecord::Base
  enum account_type: {bank_account:  1, debit_card: 2}
  validates :nickname, :account_type, :account_number, presence: :true
  validates :account_number, numericality: true, uniqueness: true
  validates :nickname, uniqueness: true
end
