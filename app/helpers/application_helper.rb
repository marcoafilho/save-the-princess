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

  def render_deck(objects)
    [].tap { |deck| add_cards_to_deck(deck, objects) }.join.html_safe
  end

  def add_cards_to_deck(deck, objects)
    index = 0
    while index != objects.size
      range = index..[index + rand(1..3), objects.size - 1].min
      deck << content_tag(:div, render(objects[range]), class: 'card-deck')
      index = range.last + 1
    end
  end
end
