module ApplicationHelper
  def is_active?(params)
    "active" if current_page?(params)
  end
end
