class WelcomeController < ApplicationController
  def index
    @quotes = Quote.all
    @authors = Author.all
  end
end
