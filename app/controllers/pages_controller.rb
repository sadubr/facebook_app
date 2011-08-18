class PagesController < ApplicationController

  def index
    @param = params[:code]
  end

end

