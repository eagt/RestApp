class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ show edit update destroy ]
  before_action :set_restaurante
  before_action :set_table
  before_action :set_order
  before_action :set_line_item, only: [:show, :update, :destroy]

  # GET /line_items or /line_items.json
  def index
    @line_items = @order.line_items
  end

  # GET /line_items/1 or /line_items/1.json
  def show

  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    
    @order = Order.new(restaurante: @restaurante, table: @table)

    if @order.save
      redirect_to restaurant_table_order_path(@restaurante, @table, @order)
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @line_item.errors, status: :unprocessable_entity }
    end  
    
   #@line_item = LineItem.new(line_item_params)

   #respond_to do |format|
   #  if @line_item.save
   #    format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully created." }
   #    format.json { render :show, status: :created, location: @line_item }
   #  else
   #    format.html { render :new, status: :unprocessable_entity }
   #    format.json { render json: @line_item.errors, status: :unprocessable_entity }
   #  end
   #end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
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


    #respond_to do |format|
    #  if @line_item.update(line_item_params)
    #    format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." }
    #    format.json { render :show, status: :ok, location: @line_item }
    #  else
    #    format.html { render :edit, status: :unprocessable_entity }
    #    format.json { render json: @line_item.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    
    @line_item.destroy
    redirect_to restaurant_table_order_path(@restaurante, @table, @order)
 


    #@line_item.destroy!
    #respond_to do |format|
    #  format.html { redirect_to line_items_url, notice: "Line item was successfully destroyed." }
    #  format.json { head :no_content }
    #end
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
      @order = @table.orders.find(params[:order_id])
    end
  
    def set_line_item
      @line_item = @order.line_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:qty, :total, :order_id, :product_id, :item_status)
    end
end
