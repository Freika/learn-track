class Knowledge < ActiveRecord::Base
  KINDS = [ 'Книга', 'Скринкаст', 'Видео' ]
  validates :name, :kind, presence: true
  validates :kind, inclusion: { in: KINDS }
  has_paper_trail
  has_many :activities
  acts_as_taggable

  scope :approved, -> { where(approved: true) }
end
