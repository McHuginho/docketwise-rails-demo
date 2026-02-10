require 'prawn'

class SolicitantesController < ApplicationController
  before_action :set_solicitante, only: %i[ show edit update destroy ]

  # GET /solicitantes or /solicitantes.json
  def index
    @solicitantes = Solicitante.all
  end

  # GET /solicitantes/1 or /solicitantes/1.json
  def show
    # @solicitante ya lo busca Rails automáticamente antes de entrar aquí
    
    respond_to do |format|
      # 1. Si piden HTML (navegador normal), muestra la vista de siempre
      format.html 
      
      # 2. Si piden PDF, generamos el documento al vuelo
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "DOCKETWISE PRO", size: 30, style: :bold
        pdf.move_down 20
        pdf.text "Expediente: #{@solicitante.nombre}"
        pdf.text "Email: #{@solicitante.email}"
        pdf.text "Estado: #{@solicitante.aprobado ? 'APROBADO' : 'PENDIENTE'}"
        
        send_data pdf.render, 
          filename: "expediente_#{@solicitante.nombre}.pdf",
          type: "application/pdf",
          disposition: "inline" # "inline" lo abre en el navegador, "attachment" lo descarga directo
      end
    end
  end

  # GET /solicitantes/new
  def new
    @solicitante = Solicitante.new
  end

  # GET /solicitantes/1/edit
  def edit
  end

  # POST /solicitantes or /solicitantes.json
  def create
    @solicitante = Solicitante.new(solicitante_params)

    respond_to do |format|
      if @solicitante.save
        format.html { redirect_to @solicitante, notice: "Solicitante was successfully created." }
        format.json { render :show, status: :created, location: @solicitante }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @solicitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitantes/1 or /solicitantes/1.json
  def update
    respond_to do |format|
      if @solicitante.update(solicitante_params)
        format.html { redirect_to @solicitante, notice: "Solicitante was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @solicitante }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @solicitante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitantes/1 or /solicitantes/1.json
  def destroy
    @solicitante.destroy!

    respond_to do |format|
      format.html { redirect_to solicitantes_path, notice: "Solicitante was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitante
      @solicitante = Solicitante.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def solicitante_params
      params.expect(solicitante: [ :nombre, :aprobado, :email ])
    end
end
