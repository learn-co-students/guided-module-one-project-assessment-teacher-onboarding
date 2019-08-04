class LabelUser < ActiveRecord::Base
  belongs_to :label
  belongs_to :user
end