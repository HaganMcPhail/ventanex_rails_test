class PayAccountsController < ApplicationController
  before_action :convert_radio, only: ["create"]

  # TODO: Add lookup to Account class

  def index
    @pay_accounts = PayAccount.all
    @pay_account = PayAccount.new
  end

  def create
    @pay_account = PayAccount.new(account_params)

    if @pay_account.save
      redirect_to root_path
    else
      ap @pay_account.errors.full_messages
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
end
