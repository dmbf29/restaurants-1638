class AddUserToRestaurants < ActiveRecord::Migration[7.1]
  def change
    Restaurant.destroy_all
    add_reference :restaurants, :user, null: false, foreign_key: true
  end
end
