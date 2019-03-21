class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :find_category, except: %i(index new create)

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "deleted"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "un_delete"
      redirect_to admin_root_path
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :parent_id
  end

  def find_category
    @category = Category.find_by_id params[:id]
  end
end
