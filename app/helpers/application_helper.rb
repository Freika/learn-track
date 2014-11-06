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

  def gravatar_for(user, options = { size: 70 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end
end
