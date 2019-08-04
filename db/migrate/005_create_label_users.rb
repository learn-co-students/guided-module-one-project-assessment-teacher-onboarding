class CreateLabelUsers < ActiveRecord::Migration[5.1]
    def change
        create_table :label_users do |t|
            t.belongs_to :label, index: true
            t.belongs_to :user, index: true
            t.datetime :label_user_date
        end
    end
end
