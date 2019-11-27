module ApplicationHelper
  def number_badge(number)
    return "[unknown]" unless number
    return (
      "<span class='number'>".html_safe +
      number.to_s +
      " Votes </span>".html_safe
    )
  end
end
