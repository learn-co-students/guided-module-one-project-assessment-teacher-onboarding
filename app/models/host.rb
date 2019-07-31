class Host < ActiveRecord::Base
    has_many :labels
    has_many :users, through: :labels
end