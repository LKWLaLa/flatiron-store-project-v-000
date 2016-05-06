require 'pry'

class LineItemsController < ApplicationController
  def new
    @line_item = LineItem.new
  end



  def create
    if !current_user.current_cart_id
      current_user.current_cart = current_user.carts.create
      current_user.current_cart.add_item(params[:item_id]).save
      current_user.save
    else
      current_user.current_cart.add_item(params[:item_id]).save
      current_user.save
    end
  redirect_to cart_path(current_user.current_cart)
end




end