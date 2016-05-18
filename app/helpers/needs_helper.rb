module NeedsHelper
  def populate_needs
    rejected = []
    approved = []
    session[:cart]["recipient"].each do |id, qty|
      need_type = NeedType.find(id)
      if current_user.needs.exists?(slug: need_type.slug)
        rejected << need_type.name
      else
        current_user.needs.create(name: need_type.name,
                                  description: need_type.description,
                                  cost: need_type.cost,
                                  image_url: need_type.image_url,
                                  slug: need_type.slug,
                                  category: need_type.category,
                                  quantity: qty
                                  )
        approved << need_type.name
      end
    end
    [approved, rejected]
  end

  def grant_need(id)
    need_type = NeedType.find(id)
    if @recipient.needs.exists?(slug: need_type.slug)
      "#{need_type.name} is already on #{@recipient.full_name}'s page. #{link}"
    else
      @recipient.needs.create(name: need_type.name,
                              description: need_type.description,
                              cost: need_type.cost,
                              image_url: need_type.image_url,
                              slug: need_type.slug,
                              category: need_type.category,
                              quantity: 1
                              )
      "#{need_type.name} added to #{@recipient.full_name}'s page. #{link}"
    end
  end

  def link
    view_context.link_to(
      "View page?",
      admin_recipient_path(username: @recipient.username)
    )
  end
end
