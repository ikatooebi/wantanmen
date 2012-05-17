class UsersController < ApplicationController
  def index
    @users = User.all
    @address = Address.find(:all).map {|u| [ u.prefecture] }
  end

  def detail
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.addresses.build
    @user.addresses.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: ' created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @now_rentals = Lend.now_rentals.where(user_id: params[:id])
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.build_address

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice:'updated'}
        format.json { head:no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
