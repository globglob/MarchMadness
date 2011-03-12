class Team < ActiveRecord::Base
	
	belongs_to :draft_pick
	has_one :user, :through => :draft_pick
	has_many :wins,  :foreign_key => 'winner_id',
	                 :class_name => 'Game',
                     :dependent => :destroy
    has_many :losers, :through => :wins
    has_many :losses, :foreign_key => 'loser_id',
                      :class_name => 'Game',
                      :dependent => :destroy
    has_many :winners, :through => :losses
	
end
