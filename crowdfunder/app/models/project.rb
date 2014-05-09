class Project < ActiveRecord::Base
	has_many :rewards
	has_many :pledges
	belongs_to :user

	accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

	validates :blurb, :title, :presence => true
	validates :start_date, :end_date, :presence => true
	validates :funding_goal, :numericality => {:only_integer => true}
end
