require "rails_helper"

describe PayAccount do
  it "should validate account number (numericality) on save" do
    pay_account = PayAccount.new(account_number: "123A45234234")
    expect(!pay_account.valid?)
    expect(pay_account.errors[:account_number]).to eq ["is not a number"]
  end

  it "should validate account number (length) on save" do
    #pay_account = PayAccount.new(account_number: "1234", account_type: 1, nickname: "Test")
    pay_account = PayAccount.new(account_number: "1234")
    expect(!pay_account.valid?)
    expect(pay_account.errors[:account_number]).to eq ["is too short (minimum is 6 characters)"]
  end

  it "should validate account number (uniqueness) on save" do
    PayAccount.create(account_number: "123456", account_type: 1, nickname: "Test")
    pay_account = PayAccount.new(account_number: "123456")
    expect(!pay_account.valid?)
    expect(pay_account.errors[:account_number]).to eq ["has already been taken"]
  end

  it "should validate nickname (uniqueness) on save" do
    PayAccount.create(account_number: "123456", account_type: 1, nickname: "Test Account")
    pay_account = PayAccount.new(nickname: "Test Account")
    expect(!pay_account.valid?)
    expect(pay_account.errors[:nickname]).to eq ["has already been taken"]
  end

  it "should validate presence of all fields on save" do
    pay_account = PayAccount.new()
    expect(!pay_account.valid?)
    expect(pay_account.errors[:nickname]).to eq ["can't be blank"]
    expect(pay_account.errors[:account_type]).to eq ["can't be blank"]
    expect(pay_account.errors[:account_number]).to eq ["can't be blank", "is not a number", "is too short (minimum is 6 characters)"]
  end
end
