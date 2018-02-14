class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
    	t.string :stripe_customer_id
      	# t.integer :plan_id
      	t.integer :user_id
      t.timestamps
    end
  end
end
