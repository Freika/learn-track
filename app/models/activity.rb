class Activity < ActiveRecord::Base
  # validates :name, :comment, :kind, presence: true
  validates :kind, inclusion: { in: Knowledge::KINDS }
end
