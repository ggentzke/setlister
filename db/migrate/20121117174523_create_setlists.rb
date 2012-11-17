class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.string :name
      t.integer :duration

      t.timestamps
    end

    create_table :setlists_songs, id: false do |t|
    	t.references :songs
    	t.references :setlists
    end

    add_index :setlists_songs, [:setlist_id, :song_id]
    add_index :setlists_songs, [:song_id, :setlist_id]

  end
end