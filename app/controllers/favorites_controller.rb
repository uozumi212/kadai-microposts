class FavoritesController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]
  
  
  def create
    micropost = Micropost.find(params[:favorite_id])
    current_user.favorite(micropost)
    flash[:success] = "投稿をお気に入り登録しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:favorite_id])
    current_user.unfavorite(micropost)
    flash[:success] = "投稿のお気に入り解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
