class CreateTableProvinceCity < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
    	t.string 	:name
    	t.integer 	:province_id
    	t.timestamps
    end

    create_table :provinces do |t|
    	t.string :name
    	t.timestamps
    end
  end
end
