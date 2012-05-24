class LendsController < ApplicationController
  before_filter :auth
  def index
    @lends = Lend.where("return_day IS NOT NULL")
    @lending = Lend.now_rentals
  end

  def repay
    @lend = Lend.find(params[:id])
  end

  def new
    @lend = Lend.new
    @target_users = User.find(:all).map {|u| [ u.name, u.id ] }
    @target_books = Book.find(:all)
    @target_books.each do |f|
      if Book.find(f.id).now_rental?
        @target_books.delete(f)
      end
    end
    @target_books = @target_books.map {|u| [ u.name, u.id ] }
    @books = Book.find(:all).map {|u| [ u.name, u.id] }
  end

  def create
    Time.zone = 'Asia/Tokyo'
    @lend = Lend.new(params[:lend])
    respond_to do |format|
      if @lend.save
        format.html { redirect_to @lend, notice: ' created.' }
        format.json { render json: @lend, status: :created, location: @lend }
      else
        format.html { render action: "new" }
        format.json { render json: @lend.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @lend = Lend.find(params[:id])
  end

  def edit
    @lend = Lend.find(params[:id])
  end

  def update
    Time.zone = 'Asia/Tokyo'
    @lend = Lend.find(params[:id])

    respond_to do |format|
      if @lend.update_attributes(params[:lend])
        format.html { redirect_to @lend, notice:'returned'}
        format.json { head:no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
