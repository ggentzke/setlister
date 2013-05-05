class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :duration
      t.string :title
      t.string :tuning
      t.string :key
      t.integer :bpm
      t.integer :play_count, default: 0
      
      t.timestamps
    end
    
    add_index :songs, :tuning
  end
end
