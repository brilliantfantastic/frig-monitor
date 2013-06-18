class AddRefrigeratorToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :refrigerator_id, :integer
  end
end
