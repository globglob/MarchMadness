class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.integer "draft_pick_id"
      t.string "name", :limit =>50
      t.string "nickname", :limit =>50
      t.integer "seed"
      t.timestamps
    end
    add_index ("teams","draft_pick_id")
  end

  def self.down
    drop_table :teams
  end
end
