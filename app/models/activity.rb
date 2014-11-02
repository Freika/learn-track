class Activity < ActiveRecord::Base
  validates :kind, inclusion: { in: Knowledge::KINDS }
  validates :name, :comment, :kind, presence: true
  has_paper_trail
end
