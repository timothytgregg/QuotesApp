class FavoritesController < ApplicationController

  def index
  end

  def new
  end

  def show
  end

  def create
    @quote=Quote.find(params[:quote_id])
    @quote.favorites.create!(favorite_params)
    redirect_to @quote
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def favorite_params
      params.require(:favorite).permit(:collection_id)
    end
end
