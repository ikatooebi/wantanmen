class UsersController < ApplicationController
  before_filter :auth
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
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        UserMailer.delay.welcome_email(@user)
        format.html { redirect_to @user, notice: ' created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        #format.html { render action: "new" }
        format.html { render json: @user.errors, status: :unprocessable_entity }
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

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice:'updated'}
        format.json { head:no_content }
      else
        #format.html { render action: 'edit' }
        format.html { render json: @user.errors, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    if params[:match] == 'and'
      #@users = User.find(:all, conditions:  ["name like ?", "%" + params[:search_name] + "%"])
      @users = User.id_is(params[:search_id]).name_is(params[:search_name])
    else
      @users = User.id_or_name_is(params[:search_id],params[:search_name])
    end
  end

end
