class ArticlesController < ApplicationController
	before_action :admin_user, only: [:new, :edit, :update, :destroy]

	def new
	    @article = Article.new
	end

	def create
		@article = Article.new(event_params)
		if @article.save
			flash[:success] = "Article created successfully"
			redirect_to @article
		else 
			flash[:alert] = "Oops, something went wrong. Please try again."
			render :new
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(event_params)
			flash[:success] = "Article updated!"
			redirect_to @article
		else
			flash[:alert] = "Update failed."
			render :edit
		end
	end

	def destroy
		Article.find(params[:id]).destroy
		flash[:success] = "Article deleted successfully"
		redirect_to articles_url
	end

	private 

		def event_params
			params.require(:article).permit(:title, :text)
		end

		# Verifies if current user is an admin
		def admin_user
			unless admin? 
				flash[:danger] = "Only administrators have access to this page"
				redirect_back_or(root_url) 
			end
		end
end

