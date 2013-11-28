class AccountsController < ApplicationController

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
	end

  
  def show
		@transactions = @account.sorted_approved_transactions
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
	
	def account_params
		params.require(:account).permit(:name, :balance, :account_group_id, :number, :sort_code, :posting_date)
	end
end
