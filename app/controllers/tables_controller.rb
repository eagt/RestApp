class TablesController < AuthorizedController
  before_action :set_table, only: %i[ show edit update destroy ]

  # GET /tables or /tables.json
  def index  
    @tables = @restaurante.tables
  end

  # GET /tables/1 or /tables/1.json
  def show
  end

  # GET /tables/new
  def new 
    @table = @restaurante.tables.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables or /tables.json
  def create
    @table = @restaurante.tables.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to restaurante_table_path(@restaurante, @table), notice: "Table was successfully created." }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1 or /tables/1.json
  def update  
    @table = @restaurante.tables.find(params[:id])
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to restaurante_table_path(@restaurante, @table), notice: "Table was successfully updated." }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1 or /tables/1.json
  def destroy
    @table.destroy!
    respond_to do |format|
      format.html { redirect_to restaurante_tables_path(@restaurante), notice: "Table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = @restaurante.tables.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.require(:table).permit(:number, :restaurante_id, :status)
    end
end
