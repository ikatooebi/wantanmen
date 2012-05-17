class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  def create
    @book = Book.new(params[:book])
    @book.save
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: ' created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @book = Book.find(params[:id])
    @lental_history = Lend.where(book_id: params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to @book }
      format.json { head :no_content }
    end
  end

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice:'updated'}
        format.json { head:no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
end
