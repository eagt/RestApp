class ProductsController < AuthorizedController
  # @product has been set in the AuthorizedController for [ show edit update destroy ]
  before_action :set_product, only: %i[show edit update destroy ]
  # GET /products or /products.json
  def index
    @products = @restaurante.products
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = @restaurante.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create    
    @product = @restaurante.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to restaurante_product_path(@restaurante, @product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    #@product = @restaurante.products.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to restaurante_product_path(@restaurante, @product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!
    respond_to do |format|
      format.html { redirect_to restaurante_products_path(@restaurante), notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @restaurante.products.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :qty_measurement, :unit_measurement, :description, :buying_cost_pck, :buying_cost_unit, :selling_cost_pck, :selling_cost_unit, :production_cost, :qty_to_stock, :qty_in_stock, :current_stock_value, :created_by, :restaurante_id)
    end
end
