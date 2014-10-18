class Knowledge < ActiveRecord::Base
  KINDS = { "Книга" => :book, "Скринкаст" => :screencast,
    "Руководство" => :tutorial }
  validates :name, :description, :kind, presence: true
  validates :kind , inclusion: { in: KINDS }
end
