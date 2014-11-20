class Patient < ActiveRecord::Base
  has_many :measures
end
