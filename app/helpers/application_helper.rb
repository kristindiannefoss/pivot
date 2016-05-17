module ApplicationHelper
  def splash_link
    if current_user && current_user.recipient?
      link_to "Profile", user_path, class: "btn btn-default btn-lg"
    else
      link_to "Donate", users_path, class: "btn btn-default btn-lg"
    end
  end
end
