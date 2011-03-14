class CreateDraftPicks < ActiveRecord::Migration
  def self.up
    create_table :draft_picks do |t|
	  t.integer "user_id"
	  t.integer "draft_order"
      t.integer "year"
      t.timestamps
    end
    add_index("draft_picks", "user_id")
  end

  def self.down
    drop_table :draft_picks
  end
end
