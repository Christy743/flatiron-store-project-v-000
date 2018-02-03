class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    @cart.save
    @user = @cart.user
    @user.current_cart_id = nil
    @user.save
    redirect_to cart_path(@cart)
  end

end
