class Episode < ActiveRecord::Base
	validates :title, presence: true 
	validates :season, presence: true 
	validates :number, presence: true 
end
