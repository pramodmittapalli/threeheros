module ApplicationHelper
def title
    base_title = "Three Heros"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  def logo
    image_tag("threeheros.png", :alt => "Three Heros", :class => "round")
  end

end
