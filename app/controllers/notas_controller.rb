class NotasController < ApplicationController
  before_action :set_nota, only: %i[ show edit update destroy ]

  def index
    @notas = Nota.all
  end

  def show
  end

  def new
    @nota = Nota.new
  end

  def edit
  end

  def create
    @nota = Nota.new(nota_params)

    respond_to do |format|
      if @nota.save
        # ¡Magia UX! Al guardar, te devuelve al perfil del cliente
        format.html { redirect_to solicitante_path(@nota.solicitante), notice: "Nota guardada exitosamente." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @nota.update(nota_params)
        format.html { redirect_to solicitante_path(@nota.solicitante), notice: "Nota actualizada." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    solicitante = @nota.solicitante
    @nota.destroy

    respond_to do |format|
      format.html { redirect_to solicitante_path(solicitante), notice: "Nota eliminada." }
    end
  end

  private
    # Busca la nota en la base de datos
    def set_nota
      @nota = Nota.find(params[:id])
    end

    # Filtro de seguridad: solo permite estos datos
    def nota_params
      params.require(:nota).permit(:contenido, :solicitante_id)
    end
end