module ApplicationHelper

  def build_menu_item(key, entity)
    model = eval(entity.to_s.capitalize).model_name
    paths = [
      eval("#{model.plural}_path"),
      eval("#{model.singular}_path(:id)"),
      eval("new_#{model.singular}_path"),
      eval("edit_#{model.singular}_path(:id)")
    ]

    style = 'list-group-item'
    target_path = eval("#{model.plural}_path")

    paths.each do |path|
      mask_path = request.path.sub(/\/\d+\/?/, '/id/').sub(/\/$/, '')
      if mask_path == path
        style << ' active'
        break
      end
    end

    link_to t(key), target_path, class: style
  end

end