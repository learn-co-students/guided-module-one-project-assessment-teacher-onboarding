class User < ActiveRecord::Base
    has_many :label_users
    has_many :labels, through: :label_users
end