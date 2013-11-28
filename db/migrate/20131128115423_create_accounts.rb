class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string   :name
      t.float    :balance
      t.integer  :account_group_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :sort_code
      t.string   :number
    end
  end
end
