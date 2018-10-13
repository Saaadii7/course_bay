class DroopColumnAddress < ActiveRecord::Migration[5.1]
    def change
    remove_column :addresses, :city
    remove_column :addresses, :province
    end
end
