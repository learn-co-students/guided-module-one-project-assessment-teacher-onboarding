class Host < ActiveRecord::Base
    has_one :location
    has_many :host_labels
    has_many :labels, through: :host_labels
end