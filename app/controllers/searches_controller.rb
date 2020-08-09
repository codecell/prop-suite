class SearchesController < ApplicationController
  include SearchesHelper

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)

    if @search.save
      redirect_to @search
    else
      flash.alert = @search.errors.full_messages[0]
      render 'new'
    end
  end

  def show
    @search = Search.find(params[:id])
  end
end
