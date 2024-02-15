class ShopsController < ApplicationController
  before_action :set_restaurante, only: %i[index  show]

def index
  @tables = @restaurante.tables
  @products = @restaurante.products
  @orders = @restaurante.orders
 # @line_items = LineItem.joins(:order).where(orders: { restaurante_id: @restaurante.id })
end

def show
end 


  private
  def set_restaurante
    @restaurante = Restaurante.find(params[:restaurante_id])
  end 

end
