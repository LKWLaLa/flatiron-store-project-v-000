class CartsController < ApplicationController

  def index
    @carts = current_user.carts
  end

  def show
    @cart = Cart.find(params[:id])
    if current_user.carts.include?(@cart)
      @current_cart = @cart
    else
      redirect_to :back, alert: "You do not have access to this page."
    end
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.update_line_items
    @cart.status = "submitted"
    @cart.save
    current_user.current_cart_id = nil
    current_user.save
    redirect_to cart_path(@cart)
  end


  private

  def cart_params
    params.require(:cart).permit(:status, :user_id)
  end

end
