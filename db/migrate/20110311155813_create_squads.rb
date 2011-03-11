class CreateSquads < ActiveRecord::Migration
  def self.up
    create_table :squads do |t|
	  t.integer "user_id"
      t.integer "team_id"
      t.integer "pick_number"
      t.timestamps
    end
    add_index("squads", "user_id")
    add_index("squads", "team_id")
  end

  def self.down
    drop_table :squads
  end
end
