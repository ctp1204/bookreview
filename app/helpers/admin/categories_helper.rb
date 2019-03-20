module Admin::CategoriesHelper
  def load_categories
    Category.all
  end
end
