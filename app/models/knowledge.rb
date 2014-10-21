class Knowledge < ActiveRecord::Base
  KINDS = [ "Книга", "Скринкаст", "Видео" ]
  validates :name, :description, :kind, presence: true
  validates :kind , inclusion: { in: KINDS }
end
