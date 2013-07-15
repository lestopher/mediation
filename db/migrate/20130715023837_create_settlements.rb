class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|

      t.timestamps
    end
  end
end
