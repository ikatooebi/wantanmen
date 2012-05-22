class GetApiController < ApplicationController

  def book
    @book = Book.all

    respond_to do |format|
      format.json { render :json => @book }
    end
  end
end
