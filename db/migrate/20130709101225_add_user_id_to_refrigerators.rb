class AddUserIdToRefrigerators < ActiveRecord::Migration
  def change
    add_column :refrigerators, :user_id, :integer
  end
end
