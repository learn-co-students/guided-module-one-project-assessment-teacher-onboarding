class User < ActiveRecord::Base
    belongs_to :host
    has_many :label_users
    has_many :labels, through: :label_users


    def compatible_hosts
        if !@compatible_hosts
            self.match_to_host
        end
        @compatible_hosts
    end

    def match_to_host
        @compatible_hosts = {}
        Host.all.each do |host|
            host_name = host.name
            self.labels.each do |label|
                if host.labels.include?(label)
                    if @compatible_hosts[host_name] == nil
                        @compatible_hosts[host_name] = [label]
                    else
                        @compatible_hosts[host_name] << label
                    end
                end
            end
        end
        @compatible_hosts
        most_match_to_host
    end

    def most_match_to_host
        hosts_by_like = @compatible_hosts.sort_by{ |host, labels| labels.size }
    end

    def match_to_guest
        @compatible_guests = {}
        # binding.pry
        self.host.users.each do |guest|
            guest_name = guest.name
            self.labels.each do |label|
                if guest.labels.include?(label)
                    if @compatible_guests[guest_name] == nil
                        @compatible_guests[guest_name] = [label]
                    else
                        @compatible_guests[guest_name] << label
                    end
                end
            end
        end
        most_match_to_guest
    end

    def most_match_to_guest
        guests_by_like = @compatible_guests.sort_by{ |guest, labels| labels.size }
    end
    
end