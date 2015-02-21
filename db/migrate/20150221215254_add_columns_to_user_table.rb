class AddColumnsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company, :string
    add_column :users, :occupation, :string
    add_column :users, :role, :string
  end
end