class PayAccountsController < ApplicationController

  # TODO: Add lookup to Account class

  def index
    @pay_accounts = PayAccount.all
  end

  def create
  end

end
