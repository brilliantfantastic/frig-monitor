class CreateRefrigerators < ActiveRecord::Migration
  def change
    create_table :refrigerators do |t|
      t.string :brand
      t.timestamps
    end
  end
end
