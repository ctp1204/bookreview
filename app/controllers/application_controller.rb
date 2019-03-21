class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include BooksHelper

  private

  def target_activity target, action = params[:action]
    current_user.activities.create! action: action, target: target
  end
end
