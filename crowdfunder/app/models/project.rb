class Project < ActiveRecord::Base
	validates :blurb, :title, :presence => true
	validates :start_date, :end_date, :presence => true
	validates :funding_goal, :numericality => {:only_integer => true}
end
