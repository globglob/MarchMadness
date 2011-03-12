class User < ActiveRecord::Base
	
	 belongs_to :draft
	 has_many :teams
end
