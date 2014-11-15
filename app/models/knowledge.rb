class Knowledge < ActiveRecord::Base
  KINDS = %w(Книга Скринкаст Видео).freeze
  validates :name, :kind, presence: true
  validates :kind, inclusion: { in: KINDS }
  has_paper_trail
  has_many :activities
  acts_as_taggable

  scope :approved, -> { where(approved: true) }
end
