# `ApplicationHelper` provides methods that helps presenting some content on
# the page.
module ApplicationHelper
  def flash_class(key)
    { notice: 'alert-success', alert: 'alert-danger' }[key.to_sym]
  end

  def root_path?
    current_page?(root_path) ||
      (controller_name == 'users' && action_name == 'create') ||
      (controller_name == 'sessions' && action_name == 'create')
  end
end
