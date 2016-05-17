module NeedsHelper
  def populate_needs
    rejected = []
    approved = []
    session[:cart]["recipient"].each do |id, qty|
      need_type = NeedType.find(id)
      if current_user.needs.exists?(slug: need_type.slug)
        rejected << need_type.name
      else
        current_user.needs.create(name: pluralize(qty, need_type.name),
                                  description: need_type.description,
                                  cost: need_type.cost * qty,
                                  image_url: need_type.image_url,
                                  slug: need_type.slug,
                                  category: need_type.category
                                  )
        approved << need_type.name
      end
    end
    [approved, rejected]
  end
end
