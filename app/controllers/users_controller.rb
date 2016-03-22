class UsersController < ApplicationController
  before_action :logged_in_user, :except => [:new, :create]
  before_action :correct_user, :except => [:new, :create]
   def show
    @user = User.find(params[:id])
    @lol = ""
    if @user.designation == "manager"
      if params[:post] != nil 
        if params[:post][:status] != ""
        @status = Post.new(:userid=>@user.id,:status=>params[:post][:status])
      if @status.save
        @lol = "Updated" 
      else
        @lol = "Something went wrong"
      end
        else
          @lol = "Empty Status"
        end
      end
    end
    
    @all_statuses = Post.where(:userid=>@user.id)
    
   end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :cnic, :age, :address, :organization, :designation, :firstname, :lastname, :phone)
  end
    
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
    
end
