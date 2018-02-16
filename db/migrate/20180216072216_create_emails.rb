class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
    	t.integer :user_id
    	t.string :from
    	t.string :to
    	t.text :subject
      t.timestamps
    end
  end
end
