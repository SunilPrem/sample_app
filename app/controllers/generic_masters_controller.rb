class GenericMastersController < ApplicationController
  before_action :set_generic_master, only: [:show, :edit, :update, :destroy]

  # GET /generic_masters
  # GET /generic_masters.json
  def index
    # @generic_masters = GenericMaster.all
    @generic_master_table_name = params[:table_name]
    @generic_master_table_type = params[:table_type]
    @generic_masters = GenericMaster.where(:table_name => params[:table_name])
    # mytemplate = params[:type] + "s"
    # render :template => "generic_masters/#{mytemplate}/index"
    # render :template => "generic_masters/index"
  end

  # GET /generic_masters/1
  # GET /generic_masters/1.json
  def show
  end

  # GET /generic_masters/new
  def new
    @generic_master = GenericMaster.new
    @generic_master.table_name = params[:table_name]
    @generic_master.table_type = params[:table_type]
  end

  # GET /generic_masters/1/edit
  def edit
  end

  # POST /generic_masters
  # POST /generic_masters.json
  def create
    @generic_master = GenericMaster.new(generic_master_params)

    respond_to do |format|
      if @generic_master.save
        format.html { redirect_to @generic_master, notice: "#{@generic_master.table_name.titleize.singularize} was successfully created." }
        format.json { render :show, status: :created, location: @generic_master }
      else
        format.html { render :new }
        format.json { render json: @generic_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generic_masters/1
  # PATCH/PUT /generic_masters/1.json
  def update
    respond_to do |format|
      if @generic_master.update(generic_master_params)
        format.html { redirect_to @generic_master, notice: "#{@generic_master.table_name.titleize.singularize} was successfully updated." }
        format.json { render :show, status: :ok, location: @generic_master }
      else
        format.html { render :edit }
        format.json { render json: @generic_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generic_masters/1
  # DELETE /generic_masters/1.json
  def destroy
    table_name = @generic_master.table_name
    table_type = @generic_master.table_type
    @generic_master.destroy
    respond_to do |format|
      format.html { redirect_to generic_masters_url(:table_name => table_name, :table_type => table_type), notice: "#{@generic_master.table_name.titleize.singularize} was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic_master
      @generic_master = GenericMaster.find(params[:id])
      @generic_master.table_name ||= params[:table_name]
      @generic_master.table_type ||= params[:table_type]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generic_master_params
      params.require(:generic_master).permit(:name, :full_name, :precedence, :table_name, :table_type)
    end
end
