class CreateHosts < ActiveRecord::Migration[5.1]
    def change
        create_table :hosts do |t|
            t.string :name
        end
    end
end
