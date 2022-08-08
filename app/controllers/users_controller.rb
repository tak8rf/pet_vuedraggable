class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @family = current_user.groups_families.first
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
