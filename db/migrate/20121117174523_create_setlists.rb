class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlist_types do |t|
      t.string :name, unique: true, nil: false
    end
    
    create_table :setlists do |t|
      t.string :title
      t.integer :duration
      t.integer :play_count
      t.belongs_to :setlist_type
      t.string :type

      t.timestamps
    end

    create_table :setlist_items do |t|
    	t.references :song
    	t.references :setlist
    	
    	t.integer :order
    end

    add_index :setlist_items, [:setlist_id, :song_id]
    add_index :setlist_items, [:song_id, :setlist_id]
  end
end