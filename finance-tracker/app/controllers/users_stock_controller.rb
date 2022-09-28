class UsersStockController < ApplicationController

  def create
    stock = Stock.check_db(params[:ticker])
    if !stock
      stock = Stock.new_lookup(params[:ticker])
      if stock != nil
       stock.save
      end
    end
    if stock
        UserStock.create(user_id:params[:user], stock_id: stock.id)
        flash[:notice] = "Added successfully to your portfolio"
        redirect_to my_portofolio_path
    else
        flash.now[:alert] = "Erro"
        render "users/my_portfolio"

    end
  end


  def destroy
    if params[:stock_id].present?
      current_user.user_stocks.where(stock_id: params[:stock_id]).each do |s|
        s.destroy
      end
    end
    redirect_to my_portofolio_path
  end


end
