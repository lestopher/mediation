class Defendant < ActiveRecord::Base
  belongs_to :user
  has_one :settlement
  attr_accessible :defendant_id, :settlement_id
end
