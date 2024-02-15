class OrdersController < ApplicationController
  before_action :set_restaurante_and_shop

  def show
    @order = @shop.orders.find(params[:id])
  end 

  def create
    @order = @shop.orders.create(order_params)
    @order.in_progress!
    redirect_to restaurante_shop_orders_path(@restaurante, @shop)
  end

  private

  def set_restaurante_and_shop
    @restaurante = Restaurante.find(params[:restaurante_id])
    @shop = @restaurante.shops.find(params[:shop_id])
  end

  def order_params
    params.require(:order).permit(:table_id)
  end
end