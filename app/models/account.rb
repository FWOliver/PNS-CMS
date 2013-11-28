class Account < ActiveRecord::Base

	belongs_to :account_group
	has_many :transactions, :dependent => :destroy

	validates_presence_of :sort_code
	validates_presence_of :number


	def sorted_transactions
		transactions.sort { |t1, t2| t2.posting_date <=> t1.posting_date }
	end

	def sorted_approved_transactions
		sorted_transactions.select { |t| t.current_status == ApprovalRequest::STATUS_APPROVED }
	end

	def balance_gbp
    	balance * account_group.currency.gbp_fx_rate
	end

	def as_json(options = {})
		{
			:id => id,
			:name => name,
			:number => number,
			:sort_code => sort_code,
			:balance => balance,
			:balance_gbp => balance_gbp
		}
	end
  

end
