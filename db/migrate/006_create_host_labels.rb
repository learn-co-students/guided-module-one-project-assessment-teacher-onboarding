class CreateHostLabels < ActiveRecord::Migration[5.1]
    def change
        create_table :host_labels do |t|
            t.belongs_to :host, index: true
            t.belongs_to :label, index: true
            t.datetime :host_label_date
        end
    end
end