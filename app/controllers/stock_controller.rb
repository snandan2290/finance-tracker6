class StockController < ApplicationController

  def serach
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock]);
      if @stock
        respond_to do |format|
          format.js {render partial: 'users/result'}
        end
          # render 'users/my_portfolio'      
      else
        respond_to do |format|
          flash.now[:alert] = "Not company foudn with ticker symbol: '#{params[:stock]}'!!!"
          format.js { render partial: 'users/result'}
        end
        
        # redirect_to my_portfolio_path
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Serach can't be 'émpty' strign"
        format.js { render partial: 'users/result'}
      end      
      # redirect_to my_portfolio_path
    end 
  end

end
