class AddCoordinatesToWeapon < ActiveRecord::Migration[6.0]
  def change
    add_column :weapons, :latitude, :float
    add_column :weapons, :longitude, :float
  end
end
