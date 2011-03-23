class CreateScores < ActiveRecord::Migration
	def self.up
		create_table :scores do |t|
			t.references :game
			t.references :team
			t.integer "points"
			t.timestamps
		end
		add_index :scores, ["game_id","team_id"]
	end
	
  def self.down
    drop_table :scores
  end
end
