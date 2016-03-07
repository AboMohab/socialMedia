class ArticlesController < ApplicationController

	before_action :require_user, only:[:show,:new,:create,:edit,:update,:destroy]

	before_action :require_editor ,only: [:show,:edit,:destroy]
	

	def index
		@articles = Article.all 
	end 

	def show
		@article = Article.find(params[:id])
	end 

	def new 
		@article = Article.new
		@user=current_user
	end 

	def create 
		@article=Article.new(article_params)
		if @article.save
			redirect_to @article
		else 
			redirect_to '/new'
		end 
	end 

	def edit
		@article = Article.find(params[:id])
	end 

	def update
		@article=Article.find(params[:id])
		if @article.update_attributes(article_params)
			redirect_to @article
		else redirect_to 'edit_path'
		end 
	end 

	def destroy
		@article=Article.find(params[:id])
		@article.destroy
		
		redirect_to '/'
	end 

	private
	def article_params
		params.require(:article).permit(:title,:author,:body,:user_id)
	end 

	
end
