class DocumentsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
  
  def index
  	@documents = Document.all.paginate(page: params[:page])
  end

  def new
  	@document = Document.new
  end

  def create
  	@document = Document.new(document_params)
  	if @document.save
  		flash[:success] = "Document uploaded successfully."
  		redirect_to documents_path
  	else
  		render :new
  	end
  end

  def destroy
  	@document = Document.find(params[:id])
  	@document.destroy
  	flash[:success] = "#{@document.name} deleted successfully"
  	redirect_to document_path
  end

  private 

  	def document_params
  		params.require(:document).permit(:name, :attachment, :public)
  	end
end
