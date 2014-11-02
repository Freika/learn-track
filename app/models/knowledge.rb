class Knowledge < ActiveRecord::Base
  KINDS = [ 'Книга', 'Скринкаст', 'Видео' ]
  validates :name, :description, :kind, presence: true
  validates :kind, inclusion: { in: KINDS }
  has_paper_trail
  has_many :activities

  scope :approved, -> { where(approved: true) }
end
