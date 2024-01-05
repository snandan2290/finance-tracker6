class RenameStockAttributes < ActiveRecord::Migration[6.0]
  def change
    rename_column :stocks, :sticket, :ticker
    rename_column :stocks, :price, :last_price
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
