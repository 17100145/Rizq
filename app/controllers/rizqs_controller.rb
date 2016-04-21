class RizqsController < ApplicationController
  before_action :set_rizq, only: [:show, :edit, :update, :destroy]

  # GET /rizqs
  # GET /rizqs.json
  def index
    @rizqs = Rizq.all
    
    @managerposts = Post.where(:user_id=>User.where(:designation=>"manager").uniq.pluck(:id))
    # @statuses = Array.new
    @names = Array.new
    @managerposts.each do |poe|
      # @statuses.push(poe)
      @names.push(User.where(:id=>poe.user_id).pluck(:username))
      @usid = session[:user_id]
    @temp = "Donate Food"
    if User.where(:id=>@usid).pluck(:designation)[0] == "user"
      @temp = "Request Food"
    end
    end
    # @statuses = @statuses.zip(@names)
    # if logged_in?
    #   @user = User.find(params[:id])
    # end
  end
  def about
  end
  def faqs
  end
  def contactus
  end
  def ourteam
  end

  # GET /rizqs/1
  # GET /rizqs/1.json
  def show
  end

  # GET /rizqs/new
  def new
    @rizq = Rizq.new
    @usid = session[:user_id]
    @add = User.where(:id=>@usid).pluck(:address)[0]
    @temp1 = "Donate"
    if User.where(:id=>@usid).pluck(:designation)[0] == "user"
      @temp1 = "Request"
    end
  end

  # GET /rizqs/1/edit
  def edit
  end

  # POST /rizqs
  # POST /rizqs.json
  def create
    if (session[:user_id] != nil)
    @rizq = Rizq.new(rizq_params)

    respond_to do |format|
      if @rizq.save
        format.html { redirect_to @rizq, notice: 'Rizq was successfully created.' }
        format.json { render :show, status: :created, location: @rizq }
      else
        format.html { render :new }
        format.json { render json: @rizq.errors, status: :unprocessable_entity }
      end
    end
    else
      respond_to do |format|
      format.html { redirect_to root_url, notice: 'Please log in.'}
      end
    end
  end

  # PATCH/PUT /rizqs/1
  # PATCH/PUT /rizqs/1.json
  def update
    respond_to do |format|
      if @rizq.update(rizq_params)
        format.html { redirect_to @rizq, notice: 'Rizq was successfully updated.' }
        format.json { render :show, status: :ok, location: @rizq }
      else
        format.html { render :edit }
        format.json { render json: @rizq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rizqs/1
  # DELETE /rizqs/1.json
  def destroy
    @rizq.destroy
    respond_to do |format|
      format.html { redirect_to rizqs_url, notice: 'Rizq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rizq
      @rizq = Rizq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rizq_params
      params.require(:rizq).permit(:user_id, :action, :food, :quantity, :address, :area, :date, :time, :perishable)
    end
end
