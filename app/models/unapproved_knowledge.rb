class UnapprovedKnowledge < Knowledge
  default_scope { where(approved: false) }
  def self.model_name
    Knowledge.model_name
  end
end
