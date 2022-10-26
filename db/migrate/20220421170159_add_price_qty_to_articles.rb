class AddPriceQtyToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :price, :decimal
    add_column :articles, :qty, :decimal
  end
end
