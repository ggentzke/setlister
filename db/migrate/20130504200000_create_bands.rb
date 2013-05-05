class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, uniq: true # doctrine introduction.  perhaps a little harsh? lulz

      t.timestamps
    end
    
    change_table :songs do |t|
      t.references :band, nil: false
    end
    change_table :setlists do |t|
      t.references :band, nil: false
    end

    add_index :songs, :band_id
    add_index :setlists, :band_id
  end
end
