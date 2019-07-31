class User < ActiveRecord::Base
    has_many :labels
    has_many :hosts, through: :labels
    belongs_to :host
end