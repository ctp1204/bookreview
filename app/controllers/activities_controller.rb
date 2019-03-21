class ActivitiesController < ApplicationController
  before_action :load_user, only: %i(index)
  def index; end

  private

  def load_user
    @activities = Activity.by_user(current_user).orderd.paginate page:
      params[:page], per_page: Settings.activities.page_index
  end
end
