class Game < ActiveRecord::Base
	has_many :scores
	has_many :teams, :through => :scores
end
