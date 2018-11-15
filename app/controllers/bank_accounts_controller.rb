class BankAccountsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :load_user, only: [:new, :create]

  def index
    @bank_accounts = User.find(params[:user_id]).bank_accounts
  end

  def show
    @bank_account = User.where(id: params[:user_id])
                        .bank_accounts
                        .where(id: params[:id])
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
binding.pry
    @bank_account = BankAccount.create! bank_params

    @user.bank_accounts.create! bank_params

    redirect_to edit_bank_account_path(@bank_account.id)
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def bank_params
    params.require(:bank_account)
          .permit(:bank_id, :bank_name, :acct_id, :acct_name)
  end
end
