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

  def card_icon(kind)
    if kind == 'Книга'
      '<i class="fa fa-book fa-5x"></i>'.html_safe
    elsif kind == 'Скринкаст'
      '<i class="fa fa-youtube-play fa-5x"></i>'.html_safe
    elsif kind == 'Статья'
      '<i class="fa fa-file-text fa-5x"></i>'.html_safe
    else
      '<i class="fa fa-file-code-o fa-5x"></i>'.html_safe
    end
  end
end
