class Activity < ActiveRecord::Base
  validates :kind, inclusion: { in: Knowledge::KINDS }
  validates :name, :comment, :kind, presence: true
  has_paper_trail
  belongs_to :user
  belongs_to :knowledge
  before_create :create_knowledge

  private

  def create_knowledge
    unless Knowledge.exists?(name: self.name)
    logger.info "#{self.name} knowledge was created"
      Knowledge.create!(name: self.name, kind: self.kind)
    end
  end
end
