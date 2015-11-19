class FavoritesController < ApplicationController

  def index
    @collection=Collection.find(params[:collection_id])
    @favorites=@collection.favorites
    @quotes=@collection.quotes
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
    @collection=Collection.find(params[:collection_id])
    @favorite=Favorite.find(params[:id])
    @favorite.destroy
    redirect_to @collection
  end

  private
    def favorite_params
      params.require(:favorite).permit(:collection_id, :quote_id)
    end
end
