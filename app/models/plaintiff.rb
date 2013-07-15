class Plaintiff < ActiveRecord::Base
  belongs_to :user
  has_one :settlement
  attr_accessible :plaintiff_id, :settlement_id
end
