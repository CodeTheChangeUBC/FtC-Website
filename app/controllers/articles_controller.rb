class ArticlesController < ApplicationController
	before_action :admin_user, only: [:new, :edit, :update, :destroy, :delete_picture]

	def create
		@article = Article.new(article_params)
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
		if @article.update_attributes(article_params)
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

	def delete_picture
		@article = Article.find(params[:article_id])
		if @article.remove_picture(params[:picture_id])
			flash[:info] = "Picture removed successfully"
		else
			flash[:warning] = "Whooooops, something went hayware.
								Please try again."
		end
		redirect_to @article
	end

	private 

		def article_params
			params.require(:article).permit(:title, :text, 
											:image1, :image1_cache, 
											:image2, :image2_cache,
											:image3, :image3_cache,
											:image4, :image4_cache)
		end

end

