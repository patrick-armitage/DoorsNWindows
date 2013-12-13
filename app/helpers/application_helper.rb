module ApplicationHelper

  def full_title(page_title)
    base_title = "DoorsNWindows"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def container_class
    if current_page?(controller: 'leads')
      'container-fluid'
    else
      'container'
    end
  end

  def icon(css_class)
    content_tag(:i, "", :class => css_class).html_safe
  end

  def sortable(column, title = nil)
    if column == sort_column &&
      if sort_direction == "DESC"
        css_class = "icon-chevron-up"
        direction = "ASC"
      else
        css_class = "icon-chevron-down"
        direction = "DESC"
      end
    else
      css_class = nil
    end

    title ||= column.titleize
    name = title.html_safe + content_tag(:i, "", :class => css_class)
    link_to name, params.merge(:sort => column, :direction => direction)
  end
end
