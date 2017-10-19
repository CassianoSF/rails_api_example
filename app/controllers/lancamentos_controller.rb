class LancamentosController < AuthenticatedController
  before_action :set_lancamento, only: [:show, :update, :destroy]

  # GET /lancamentos
  def index
    @lancamentos = current_user.lancamentos

    render json: @lancamentos
  end

  # GET /lancamentos/1
  def show
    render json: @lancamento
  end

  # POST /lancamentos
  def create
    @lancamento = current_user.lancamentos.new(lanecamento_params)
    binding.pry

    if @lancamento.save
      render json: @lancamento, status: :created, location: @lancamento
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lancamentos/1
  def update
    if @lancamento.update(lanecamento_params)
      render json: @lancamento
    else
      render json: @lancamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lancamentos/1
  def destroy
    @lancamento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lancamento
      @lancamento = current_user.lancamentos.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def lanecamento_params
      params.require(:lancamento).permit(:valor, :descricao, :categoria, :tipo)
    end
end
