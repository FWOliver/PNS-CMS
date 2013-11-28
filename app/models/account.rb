class Account < ActiveRecord::Base

	belongs_to :account_group

	validates_presence_of :sort_code
	validates_presence_of :number
end
