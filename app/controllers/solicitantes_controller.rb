require 'prawn'

class SolicitantesController < ApplicationController
  before_action :set_solicitante, only: %i[ show edit update destroy ]

  # GET /solicitantes or /solicitantes.json
  def index
    @solicitantes = Solicitante.all
  end

  # GET /solicitantes/1 or /solicitantes/1.json
  def show
    respond_to do |format|
      format.html 
      
      format.pdf do
        # Aquí instanciamos nuestro Service Object y llamamos al método .call
        pdf_binario = GeneradorExpedienteService.new(@solicitante).call
        
        send_data pdf_binario, 
          filename: "expediente_#{@solicitante.nombre}.pdf",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  
  def new
    @solicitante = Solicitante.new
  end

  
  def edit
  end

  
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

  
  def destroy
    @solicitante.destroy!

    respond_to do |format|
      format.html { redirect_to solicitantes_path, notice: "Solicitante was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    
    def set_solicitante
      @solicitante = Solicitante.find(params.expect(:id))
    end

    
    def solicitante_params
      params.expect(solicitante: [ :nombre, :aprobado, :email ])
    end
end
