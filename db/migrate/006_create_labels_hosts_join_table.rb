class CreateLabelsHostsJoinTable < ActiveRecord::Migration[5.1]
    def change
        create_table :labels_hosts, id: false do |t|
            t.integer :label_id
            t.integer :host_id
        end
    
        add_index :labels_hosts, :label_id
        add_index :labels_hosts, :host_id
    end
end
