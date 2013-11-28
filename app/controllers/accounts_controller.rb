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

  end
  
  def edit
    @account = Account.find params[:id]
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
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
    #uncomment below when creating accounts
    #@account = Account
  end

	def account_params
		params.require(:account).permit(:name, :balance, :account_group_id, :number, :sort_code, :posting_date)
	end
end
