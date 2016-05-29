class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def success_message(entity, action)
    message = t(
      'success_message',
      entity: entity.model_name,
      action: t("success.actions.#{action}")
    )
  end
end