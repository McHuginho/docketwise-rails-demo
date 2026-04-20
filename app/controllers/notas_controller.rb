class NotasController < ApplicationController
  # Solo buscamos al solicitante cuando vamos a crear una nota nueva
  before_action :set_solicitante, only: %i[ create ]

  def create
    @nota = @solicitante.notas.build(nota_params)

    respond_to do |format|
      if @nota.save
        # ¡La Magia UX 2.0! Turbo Stream actualiza la página sin recargarla
        format.turbo_stream
        format.html { redirect_to @solicitante, notice: 'Nota agregada con éxito.' }
      else
        format.html { redirect_to @solicitante, alert: 'No se pudo guardar la nota.' }
      end
    end
  end

  def destroy
    @nota = Nota.find(params[:id])
    solicitante = @nota.solicitante
    @nota.destroy

    respond_to do |format|
      # Si queremos, más adelante podemos hacer que se borre sin recargar también
      format.html { redirect_to solicitante_path(solicitante), notice: "Nota eliminada." }
    end
  end

  private

    def set_solicitante
      # Seguridad máxima: aseguramos que la nota vaya al cliente de ESTE abogado
      @solicitante = current_user.solicitantes.find(params[:solicitante_id])
    end

    def nota_params
      # Como el solicitante_id ahora viene en la URL segura, 
      # el formulario solo necesita enviar el contenido.
      params.require(:nota).permit(:contenido)
    end
end