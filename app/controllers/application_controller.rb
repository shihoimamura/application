class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def redirect_to_posts
    redirect_to posts_path if logged_in?
  end

end
