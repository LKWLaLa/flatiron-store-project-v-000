class CartsController < ApplicationController

  def index
    @carts = current_user.carts
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create(cart_params)
    redirect_to cart_path(@cart)
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
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
    redirect_to cart_path(@cart)
  end

  def destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:status, :user_id)
  end

end
