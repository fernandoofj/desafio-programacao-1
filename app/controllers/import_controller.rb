class ImportController < ApplicationController
  
	def index
	end
  
	def upload
		params.require(:file)
		File.open(params[:file].tempfile.path) do |stream|
			service = Import::OrderImportService.new(stream)
			service.import
			@orders = service.orders
			@total = service.total
		end  
	rescue ActionController::ParameterMissing
		flash[:error] = "Arquivo de vendas deve ser informado"
		redirect_to action: :index
	rescue => exception
		flash[:error] = "Erro durante o processamento do arquivo: #{exception}"
		redirect_to action: :index  
	end
  
	private
end