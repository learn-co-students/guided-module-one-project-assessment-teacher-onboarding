class HostLabel < ActiveRecord::Base
  belongs_to :label
  belongs_to :host
end