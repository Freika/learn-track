module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def nice_russian_date(post)
    if post == Date.today
      "Сегодня, #{Russian::strftime(post, '%e %B')}"
    elsif post == Date.yesterday
      "Вчера, #{Russian::strftime(post, '%e %B')}"
    else
      Russian::strftime(post, '%e %B %Y')
    end
  end
end
