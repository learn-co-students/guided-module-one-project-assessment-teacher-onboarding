class CreateUsers < ActiveRecord::Migration[5.1]
    def change
        create_table :users do |t|
            t.string :name
            t.belongs_to :host, index: true
        end
    end
end
