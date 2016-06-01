class FuncionalidadesController < ApplicationController
  before_action :set_funcionalidade, only: [:show, :edit, :update, :destroy]

  # GET /funcionalidades
  # GET /funcionalidades.json
  def index
    @funcionalidades = Funcionalidade.all
  end

  # GET /funcionalidades/1
  # GET /funcionalidades/1.json
  def show
  end

  # GET /funcionalidades/new
  def new
    @funcionalidade = Funcionalidade.new
  end

  # GET /funcionalidades/1/edit
  def edit
  end

  # POST /funcionalidades
  # POST /funcionalidades.json
  def create
    @funcionalidade = Funcionalidade.new(funcionalidade_params)

    respond_to do |format|
      if @funcionalidade.save
        format.html { redirect_to @funcionalidade, notice: success_message(Funcionalidade, 'create') }
        format.json { render :show, status: :created, location: @funcionalidade }
      else
        format.html { render :new }
        format.json { render json: @funcionalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionalidades/1
  # PATCH/PUT /funcionalidades/1.json
  def update
    respond_to do |format|
      if @funcionalidade.update(funcionalidade_params)
        format.html { redirect_to @funcionalidade, notice: success_message(Funcionalidade, 'update') }
        format.json { render :show, status: :ok, location: @funcionalidade }
      else
        format.html { render :edit }
        format.json { render json: @funcionalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionalidades/1
  # DELETE /funcionalidades/1.json
  def destroy
    @funcionalidade.destroy
    respond_to do |format|
      format.html { redirect_to funcionalidades_url, notice: success_message(Funcionalidade, 'destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionalidade
      @funcionalidade = Funcionalidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionalidade_params
      params.require(:funcionalidade).permit(:identificador, :nome, :descricao)
    end
end
