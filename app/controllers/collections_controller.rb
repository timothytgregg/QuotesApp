class CollectionsController < ApplicationController

  def index
    @collections = Collection.all
    #some like @collections = Collection.current_user or something might create some privacy.
  end

  def new
    @collection = Collection.new
  end

  def show
    @collection = Collection.find(params[:id])
    @quotes = @collection.quotes
  end

  def create
    @collection = Collection.new(collection_params)
#what are fail conditions for your checks.
    if @collection.save
      redirect_to collection_path(@collection)
    else
      render 'new'
    end
  end

  def edit
    @collection = Collection.find(params[:id])
    @quotes = @collection.quotes
  end

  def update
    @collection = Collection.find(params[:id])

    if @collection.update(collection_params)
      redirect_to @collection
    else
      render 'edit'
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to collections_path
  end

  private
    def collection_params
      params.require(:collection).permit(:title)
    end

end
