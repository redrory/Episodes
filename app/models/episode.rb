class Episode < ActiveRecord::Base
	validates :title, presence: true 
	validates :season, presence: true 
	validates :number, presence: true 

	belongs_to :user
	#attr_accessible :title
end
