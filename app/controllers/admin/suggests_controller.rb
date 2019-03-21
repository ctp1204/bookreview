class Admin::SuggestsController < ApplicationController
  layout "admin"
  before_action :load_suggest, only: :update
  def index
    @suggests = Suggest.includes(:user).newest
  end

  def update
    @suggest.status = params[:value]
    if @suggest.save
      flash[:warning] =  t "controller.admin.book_status", name: @suggest.title,
        value: @suggest.status
      redirect_to admin_suggests_path
    else
      flash[:danger] = "faild"
    end
  end

  private

  def load_suggest
    @suggest = Suggest.find_by id: params[:id]
  end
end
