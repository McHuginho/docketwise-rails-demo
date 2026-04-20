class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]

  # GET /eventos
  def index
    if params[:query].present?
      # Búsqueda en tiempo real a prueba de bases de datos
      @eventos = current_user.eventos.where("LOWER(titulo) LIKE LOWER(?)", "%#{params[:query]}%")
    else
      @eventos = current_user.eventos.all
    end
  end

  # GET /eventos/1
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  def create
    # Aseguramos que el evento le pertenezca al usuario que inició sesión
    @evento = current_user.eventos.build(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to eventos_path, notice: "Evento creado con éxito." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to eventos_path, notice: "Evento actualizado con éxito." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  def destroy
    @evento.destroy!

    respond_to do |format|
      format.html { redirect_to eventos_path, notice: "Evento eliminado." }
    end
  end

  private
    
    def set_evento
      # Seguridad: Solo puedes ver/editar tus propios eventos
      @evento = current_user.eventos.find(params[:id])
    end

    def evento_params
      params.expect(evento: [ :titulo, :descripcion, :fecha ])
    end
end