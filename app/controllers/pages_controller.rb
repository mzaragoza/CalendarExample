class PagesController < ApplicationController
  before_filter :redirect


  private
  def redirect
    redirect_to users_root_path
  end
end

