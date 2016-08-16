class ArticlesController < ApplicationController
	before_action :admin_user, only: [:new, :edit, :update, :destroy]

	def create
		@article = Article.new(event_params)
		if @article.save
			flash[:success] = "Article created successfully"
			redirect_to articles_path
		else 
			render articles_path
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all.order('created_at desc').paginate(page: params[:page], 
																  per_page: 10)
		@article = Article.new
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
			flash[:warning] = "Update failed."
			redirect_to @article
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

end

