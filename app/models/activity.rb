class Activity < ActiveRecord::Base
  validates :name, :description, :kind, presence: true
  validates :kind, inclusion: { in: Knowledge::KINDS }
end
