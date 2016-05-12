module NeedsHelper
  def populate_needs
    session[:cart].each do |id, qty|
      need = NeedType.find(id)
      current_user.needs.create(name: pluralize(qty, need.name),
                                description: need.description,
                                cost: need.cost * qty,
                                image_url: need.image_url,
                                slug: need.slug,
                                category: need.category
                                )
    end
  end
end
