class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
	  t.integer "winner_id"
      t.integer "loser_id"
	  t.integer "winner_score"
      t.integer "loser_score"
      t.integer "round"
      t.timestamps
    end
    add_index :games, ["winner_id","loser_id"]
  end

  def self.down
    drop_table :games
  end
end
