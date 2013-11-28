class AccountsController < ApplicationController
<<<<<<< Updated upstream
=======
  before_action :set_account, only: [:show, :edit, :update, :destroy, :create, :new]
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
=======
		@account = Account.new
>>>>>>> Stashed changes
	end

  
  def show
<<<<<<< Updated upstream
		@transactions = @account.sorted_approved_transactions
  end
  
=======
		@account = Account
  end
  
  def edit
    @account = Account.find params[:id]
  end
>>>>>>> Stashed changes

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
	
<<<<<<< Updated upstream
=======
  def set_account
    @account = Account.find(params[:id])
  end
  
>>>>>>> Stashed changes
	def account_params
		params.require(:account).permit(:name, :balance, :account_group_id, :number, :sort_code, :posting_date)
	end
end
