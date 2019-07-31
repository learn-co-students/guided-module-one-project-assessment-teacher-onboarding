class CreateLabelsUsersJoinTable < ActiveRecord::Migration[5.1]
    def change
        create_table :labels_users, id: false do |t|
            t.integer :label_id
            t.integer :user_id
        end
    
        add_index :labels_users, :label_id
        add_index :labels_users, :user_id
    end
end
