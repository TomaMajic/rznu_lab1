class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :photo_path
      t.string :caption
      t.integer :num_likes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
