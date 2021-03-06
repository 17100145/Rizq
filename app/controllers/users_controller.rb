class UsersController < ApplicationController
  before_action :logged_in_user, :except => [:new, :create]
  before_action :correct_user, :except => [:new, :create]
   def show
    @user = User.find(params[:id])
    @lol = ""
    if @user.designation == "manager"
      if params[:post] != nil 
        if params[:post][:status] != ""
        @status = Post.new(:user_id=>@user.id,:status=>params[:post][:status])
      if @status.save
        @lol = "Updated" 
      else
        @lol = "Something went wrong"
      end
        else
          @lol = "Empty Status"
        end
      end
      if params[:usern]!= nil
        @riz = Rizq.find(params[:rizq_id])
        @nam = User.find(params[:usern][:useri])
        @nam = @nam[:username]
        @riz.volunteer = @nam
        @riz.save
      end
      if params[:delete]!= nil
        @riz = Rizq.destroy(params[:rizq_id])
      end
    end
    if params[:complete]!= nil
      @riz = Rizq.find(params[:rizq_id])
      @riz.completed = true
      @riz.save
    end
    
    @all_statuses = Post.where(:user_id=>@user.id)
    @all_pending_volunteers = User.where(:designation=>'volunteer', :approval=>false)
    @don_rizqs = Rizq.where(:action=>'Donate')
    @don_names = getArr(@don_rizqs)
    @req_rizqs = Rizq.where(:action=>'Request', :completed=>true)
    @req_names = getArr(@req_rizqs)
    @ass_req_rizqs = Rizq.where(:action=>'Request', :completed=> false, :volunteer=>nil)
    @ass_req_names = getArr(@ass_req_rizqs)
    @in_req_rizqs = Rizq.where(:action=>'Request', :completed=>false).where.not(:volunteer=>nil)
    @in_req_names = getArr(@in_req_rizqs)
    
    @voli = User.where(:designation=>'volunteer', :approval=>true)
    @voli = @voli.pluck(:username,:id)
    @myjobs = Rizq.where(:volunteer=>@user.username, :completed=>false)
    @myjobs_names = getArr(@myjobs)
    @comp_myjobs = Rizq.where(:volunteer=>@user.username, :completed=>true)
    @comp_myjobs_names = getArr(@comp_myjobs)
    

    @myreqs = Rizq.where(:user_id=>@user.id, :completed=>false)
    
    @comp_myreqs = Rizq.where(:user_id=>@user.id, :completed=>true)
    @mydons = Rizq.where(:user_id=>@user.id)
   end
  
  
  def getArr(temp)
    @temp1 = Array.new
    temp.each do |ri|
      @temp1.push(User.where(:id=>ri.user_id).pluck(:username))
    end
    return @temp1
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
  def activate
    @voli = User.find(params[:volid])
    @voli.update_attribute(:approval, true)
    @user = User.find(session[:user_id]);
    redirect_to user_path(@user)
  end
  def reject
    @voli = User.find(params[:volid])
    @voli.destroy
    @user = User.find(session[:user_id]);
    redirect_to user_path(@user)
  end
  
  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :cnic, :age, :address, :organization, :designation, :firstname, :lastname, :phone)
  end
  
  def user_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :cnic, :age, :address, :organization, :firstname, :lastname, :phone)
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_update_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
end
