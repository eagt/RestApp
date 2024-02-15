class LineItemsController < ApplicationController
  before_action :set_order

  def create
    @line_item = @order.line_items.new(line_item_params)
    if @line_item.save
      redirect_to [@restaurante, @shop, @order]
    else
      # handle error
    end
  end

  def destroy
    @line_item = @order.line_items.find(params[:id])
    @line_item.destroy
    redirect_to [@restaurante, @shop, @order]
  end

  private

  def set_order
    @restaurante = Restaurante.find(params[:restaurante_id])
    @shop = @restaurante.shops.find(params[:shop_id])
    @order = @shop.orders.find(params[:order_id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end