class StocksController < ApplicationController

  def search
    if params[:stock].present?

      @stock = Stock.new_lookup(params[:stock])
      if @stock
      #@stock = Stock.new(ticker: params[:stock], name: params[:stock], last_price: calculate_random_price)
        respond_to do |format|
          format.js{ render partial: 'users/result'}
        end
      #render "users/my_portfolio", method: :get
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js{ render partial: 'users/result'}
        end
        #redirect_to my_portofolio_path
      end
    else
      #flash[:alert] = "Please enter a symbol to search"
      #redirect_to my_portofolio_path
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js{ render partial: 'users/result'}
      end
    end

  end

  private
  def search_params

  end

  def calculate_random_price
    rand * rand*1000
  end
end
