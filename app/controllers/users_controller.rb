class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = Prototype.includes(:user).where(user: @user.id)
  end
end
