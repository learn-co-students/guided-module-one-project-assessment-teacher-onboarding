class Label < ActiveRecord::Base
    has_many :label_users
    has_many :users, through: :label_users
    has_many :host_labels
    has_many :hosts, through: :host_labels
end