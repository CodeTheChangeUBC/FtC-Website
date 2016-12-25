class DocumentsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
  
  def index
  	@documents = Document.all.paginate(page: params[:page])
    @document = Document.new
  end

  def create
  	@document = Document.new(document_params)
  	if @document.save
  		flash[:success] = "Document uploaded successfully."
  		redirect_to documents_path
  	else
  		render :index
      flash[:warning] = "Failed to upload document. 
                        Please ensure the extension is one of .pdf .doc .docx .html or .htm."
  	end
  end

  def destroy
  	Document.find(params[:id]).destroy
  	flash[:success] = "Document deleted successfully"
  	redirect_to documents_path
  end

  private 

  	def document_params
  		params.require(:document).permit(:name, :attachment, :public, :url)
  	end
end
