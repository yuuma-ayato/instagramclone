class AddColumnToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :image, :text
  end
end
