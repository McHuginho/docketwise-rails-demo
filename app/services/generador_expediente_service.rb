class GeneradorExpedienteService
  # El método initialize se ejecuta cuando "llamamos" al especialista
  def initialize(solicitante)
    @solicitante = solicitante
  end

  # El método call es el que hace el trabajo duro
  def call
    pdf = Prawn::Document.new
    pdf.text "DOCKETWISE PRO", size: 30, style: :bold
    pdf.move_down 20
    pdf.text "Expediente: #{@solicitante.nombre}"
    pdf.text "Email: #{@solicitante.email}"
    pdf.text "Estado: #{@solicitante.aprobado ? 'APROBADO' : 'PENDIENTE'}"
    
    # Devuelve el PDF renderizado (en formato binario)
    pdf.render
  end
end