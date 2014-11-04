module KnowledgeHelper
  def card_bg_color(kind)
    if kind == 'Книга'
      'book'
    elsif kind == 'Скринкаст'
      'screencast'
    elsif kind == 'Статья'
      'article'
    else
      'tutorial'
    end
  end
end
