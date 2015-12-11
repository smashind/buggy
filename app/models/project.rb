class Project < ActiveRecord::Base
	has_many :issues
	validates :name, :description, presence: true
	validates :name, uniqueness: true
end
