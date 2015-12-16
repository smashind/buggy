class Project < ActiveRecord::Base
	has_many :issues
	belongs_to :user
	
	validates :name, :description, presence: true
	validates :name, uniqueness: true
end
