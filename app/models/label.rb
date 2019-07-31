class Label < ActiveRecord::Base
    has_many :users
    has_many :hosts
end