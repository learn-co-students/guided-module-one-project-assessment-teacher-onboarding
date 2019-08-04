class User < ActiveRecord::Base
    has_many :label_users
    has_many :labels, through: :label_users

    attr_accessor :compatible_hosts    

    def match_to_host
        
    end
end