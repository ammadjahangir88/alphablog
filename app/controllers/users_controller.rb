class UsersController < ApplicationController
  before_action :require_same_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: "Welcome to Alphablog #{@user.username}" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to articles_path, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    flash[:danger] = "User and all articles created by user have been deleted"

    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :email, :password)
  end

  def require_same_user
    @user = User.find(params[:id])
 
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only Admin and Users can perform their actions "
      redirect_to root_path
    end
  end
end
