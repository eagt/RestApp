class OrdersController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_table
  before_action :set_restaurante

  # GET /orders or /orders.json
  #def index
  #  #It needs to be obtain with a query
  #  @orders = Order.all
  #end

  # GET /orders/1 or /orders/1.json
  def show
    @products = Product.all # Fetch all products for the menu
    @line_items = @order.line_items
    @total = @line_items.sum(&:total)
  end

  # GET /orders/new
  #def new
  #  @order = Order.new(restaurante: @restaurante, table: @table)
  #end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(restaurante: @restaurante, table: @table)
    if @order.save
      product = Product.find(params[:product_id])
      quantity = params[:quantity].to_i

      @order.line_items.create(product: product, quantity: quantity)
      redirect_to restaurant_table_order_path(@restaurante, @table, @order)
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    # Check if the line item already exists for the product in the order
    line_item = @order.line_items.find_by(product: product)

    if line_item
      # Update the quantity if the line item exists
      line_item.update(quantity: line_item.quantity + quantity)
    else
      # Create a new line item if it doesn't exist
      @order.line_items.create(product: product, quantity: quantity)
    end

    redirect_to restaurant_table_order_path(@restaurante, @table, @order)
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    # Not so sure about this action
    @line_item = @order.line_items.find(params[:id])
    @line_item.destroy
    redirect_to restaurant_table_order_path(@restaurante, @table, @order)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurante
      @restaurante = Restaurante.find(params[:restaurant_id])
    end
  
    def set_table
      @table = @restaurante.tables.find(params[:table_id])
    end
  
    def set_order
      @order = @table.orders.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:total, :restaurante_id, :table_id, :order_status)
    end
end
