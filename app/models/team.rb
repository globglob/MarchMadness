class Team < ActiveRecord::Base
	
	has_one :draft_pick
	has_one :user, :through => :draft_pick
	
	has_many :scores
	has_many :games, :through => :scores
    	
end
