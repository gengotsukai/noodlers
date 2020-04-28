class User::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def edit
		@genre = Genre.find(params[:id])
		@shops = Shop.all
	end

	def create
		@genre = Genre.new(genre_params)
		if  @genre.save!
      		redirect_to user_genres_path, notice: "ジャンルの作成が完了しました！"
    	else
    		@genres = Genre.all
      		render :index
    	end
	end

	def update
		@genre = Genre.find(params[:id])
    	if 	@genre.update(genre_params)
     		redirect_to user_genres_path, notice: "ジャンルの編集が完了しました！"
    	else
      		render :edit
    	end
	end

	def genre_params
    	params.require(:genre).permit(:genre_name)
  	end
end
