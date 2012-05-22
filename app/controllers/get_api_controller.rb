class GetApiController < ApplicationController

  def book
    render :json => Book.all
    #respond_to do |format|
    #  format.json { render :json => @book }
    #end
  end
end
