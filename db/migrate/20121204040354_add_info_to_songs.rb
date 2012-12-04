class AddInfoToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :tuning, :string, null: true
    add_column :songs, :key, :string, null: true
    add_column :songs, :bpm, :integer, null: true
  end
end
