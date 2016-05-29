module ApplicationHelper

  def build_menu_item(key, path)
    style = 'list-group-item'
    style << ' active' if (request.path == path)

    link_to t(key), path, class: style
  end

end