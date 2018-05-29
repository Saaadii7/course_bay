class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
    	t.string :name
      t.string :hover_name
    	t.string :description
    	t.string :picture
    	t.string :minilogo

      t.timestamps
    end
  	add_column :images, :service_id, :integer
  	add_column :videos, :service_id, :integer
  	add_column :documents, :service_id, :integer
  	add_column :sounds, :service_id, :integer
  end
end
