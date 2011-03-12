class Game < ActiveRecord::Base
	belongs_to :winner, :class_name => "Team"
	belongs_to :loser,  :class_name => "Team"
end
