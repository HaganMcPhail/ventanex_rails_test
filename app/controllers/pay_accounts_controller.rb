class PayAccountsController < ApplicationController
  before_action :convert_radio, only: ["create"]
  before_action :get_account_number, only: ["index"]

  def index
    @pay_accounts = PayAccount.all
    @pay_account = PayAccount.new
  end

  def create
    @pay_account = PayAccount.new(account_params)

    if @pay_account.save
      redirect_to root_path
    else
      redirect_to root_path, flash: { error: @pay_account.errors.full_messages }
    end
  end

  def account_params
    params.require(:pay_account).permit(:nickname,
                                        :account_type,
                                        :account_number)
  end

  def convert_radio
    params[:pay_account][:account_type] = params[:pay_account][:account_type].to_i
  end

  def get_account_number
    @account_number = Account.account_number
  end
end
