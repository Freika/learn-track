class ApprovedKnowledge < Knowledge
  default_scope { where(approved: true) }
  def self.model_name
    Knowledge.model_name
  end
end
