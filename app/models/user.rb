class User < ActiveRecord::Base
	
	 has_many :draft_picks
	 has_many :teams, :through => :draft_picks
end
