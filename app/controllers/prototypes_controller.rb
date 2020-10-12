class PrototypesController < ApplicationController
  before_action :authenticate_user![:new]
  before_action :move_to_edit, except: [:index, :show]
  def index
    @users = User.all
    @prototypes = Prototype.all
  end 
 
  def new
    @prototype = Prototype.new
  end
 
  def create
    @prototype = Prototype.new(prototype_params)
     if @prototype.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.save
      redirect_to show
    else
      render edit
    end
  end

  def destroy
    prototype= Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
 
  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
 
  def move_to_edit
   unless user_signed_in?
     redirect_to action: :index
   end
  end
 
end