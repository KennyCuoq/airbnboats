class DashboardController < ApplicationController
  def user_profile
    @user = current_user
    @boats = @user.boats
    authorize :dashboard, :show?
  end
end
