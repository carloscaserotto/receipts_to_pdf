class AddSInvoiceToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :invoice, foreign_key: true
  end
end
