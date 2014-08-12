module ApplicationHelper

  def l(d)
    d ? I18n.l(d) : ""
  end

end
