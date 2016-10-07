class CreateBand < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :bands, :name, unique: true

    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false
      t.string :category, null: false
      t.timestamps
    end
    add_index :albums, :band_id

    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.string :category, null: false
      t.text :lyrics, null: false
      t.timestamps
    end
    add_index :tracks, :album_id

  end
end
