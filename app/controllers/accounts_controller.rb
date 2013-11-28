class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy, :create, :new]


	def index
		@accounts = Account.all
	end

	def create
    @account = Account.new(account_params)
    respond_to do |format|
      	if @account.save
        	format.html { redirect_to accounts_path, notice: 'Account was successfully created.' }
      	else
       		format.html { render action: "new" }
      	end
    end
	end

	def new
		@account = Account.new
	end

  
  def show
		@account = Account
  end
  
  def edit
    @account = Account.find params[:id]
  end

  def destroy
    if @account.present?
       @account.destroy
       redirect_to accounts_path, notice: 'Account was successfully deleted.'
     end
   end

   def update
     respond_to do |format|
       if @account.update(account_params)
         format.html { redirect_to accounts_path, notice: 'Account was successfully updated.' }
       else
         format.html { render action: 'edit' }
       end
     end
   end

private 

  def set_account
    @account = Account.find(params[:id])
  end

	def account_params
		params.require(:account).permit(:name, :balance, :account_group_id, :number, :sort_code, :posting_date)
	end
end
