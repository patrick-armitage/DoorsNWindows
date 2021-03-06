module ApplicationHelper

  def full_title(page_title)
    base_title = "DoorsNWindows"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def body_id
    params[:controller].to_s + '_' + params[:action].to_s
  end

  def container_class
    if params[:controller] == 'leads' || params[:action] == 'contact_info'
      'container-fluid'
    else
      'container'
    end
  end

  def is_home_form?
    if params[:controller] == "static_pages" && params[:action] == "home"
      true
    else
      false
    end
  end

  def icon(css_class, opaque=nil)
    opaque_class = opaque ? " icon-opaque" : ""
    content_tag(:i, "", :class => css_class + opaque_class).html_safe
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
