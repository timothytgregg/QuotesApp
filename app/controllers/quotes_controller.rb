class QuotesController < ApplicationController

  def index
    if params[:author_id]
      @author = Author.find(params[:author_id])
      @quotes = Quote.all.where(author_id:@author.id)
    elsif params[:collection_id]
      @collection = Collection.find(params[:collection_id])
      @quotes = @collection.quotes
      render 'collection_index'
    else
      @quotes = Quote.all
      render 'no_author_index'
    end
  end

  def show
    @quote=Quote.find(params[:id])
    if @quote.author
      render 'show'
    else
      render 'no_author_show'
    end
  end

  def new
    if params[:author_id]
      @quote=Quote.new
    else
      @quote=Quote.new
      render 'no_author_new'
    end
  end

  def edit
    @quote=Quote.find(params[:id])
  end

  def create
    binding.pry
    if params[:author_id]
      @author = Author.find(params[:author_id])
      @quote = @author.quotes.new(quote_params)
    elsif params[:quote][:author_id]
      if Author.find_by(name:params[:quote][:author_id])
        @author=Author.find_by(name:params[:quote][:author_id])
        @quote=@author.quotes.create(content:params[:quote][:content])
      else
        @author=Author.create(name:params[:quote][:author_id])
        @quote = @author.quotes.new(content:params[:quote][:content])
      end
    else
      @quote = Quote.new(quote_params)
    end

    if @quote.save
      redirect_to quote_path(@quote)
    else
      render 'new'
    end
#Like we talked about. I think you can do something where if you the author is
#not found in the author table it is added would be super cool.
  end

  def update
    @quote = Quote.find(params[:id])
    @author = @quote.author

    if @quote.update(quote_params)
      redirect_to quote_path
    else
      render 'edit'
    end

  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    if params[:author_id]
      redirect_to author_quotes_path
    else
      redirect_to quotes_path
    end
  end

  private
    def quote_params
      params.require(:quote).permit(:content, :auteur, :source, :year, :author_id)
    end

end
