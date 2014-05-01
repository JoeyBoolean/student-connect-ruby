class AddMajorAndStandingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :major, :string
    add_column :users, :standing, :string
  end
end
