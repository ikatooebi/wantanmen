class GetApiController < ApplicationController

  def book
    render :json => Book.all
  end
end
