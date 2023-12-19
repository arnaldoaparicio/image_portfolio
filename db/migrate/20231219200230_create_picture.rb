class CreatePicture < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :description
      t.string :type
      t.string :device
      t.string :location

      t.timestamps
    end
  end
end
