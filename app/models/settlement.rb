class Settlement < ActiveRecord::Base
  attr_accessible :plaintiff, :defendant, :settlement_amount
end
