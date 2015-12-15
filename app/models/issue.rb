class Issue < ActiveRecord::Base
  belongs_to :project
  validates :name, :description, presence: true
end
