class DraftPick < ActiveRecord::Base
	has_one :team
	belongs_to :user
end
