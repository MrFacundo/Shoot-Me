class ChangeTypeInLocations < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :type, :style
  end
end
