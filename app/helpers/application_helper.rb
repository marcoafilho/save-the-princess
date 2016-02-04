module ApplicationHelper
  def flash_class(key)
    { notice: 'positive', alert: 'negative' }[key.to_sym]
  end

  def root_path?
    current_page?(root_path) ||
      (controller_name == 'users' && action_name == 'create') ||
      (controller_name == 'sessions' && action_name == 'create')
  end
end
