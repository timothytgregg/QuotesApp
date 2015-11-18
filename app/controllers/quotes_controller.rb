class QuotesController < ApplicationController

  def index
    if params[:author_id]
      @author = Author.find(params[:author_id])
      @quotes = Quote.all.where(author_id:@author.id)
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

    if params[:author_id]
      @author = Author.find(params[:author_id])
      @quote = @author.quotes.new(quote_params)
    else
      @quote = Quote.new(quote_params)
    end

    if @quote.save
      redirect_to quote_path(@quote)
    else
      render 'new'
    end

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
      params.require(:quote).permit(:content, :auteur, :source, :year)
    end

end
