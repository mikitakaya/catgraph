class Public::FavoritesController < ApplicationController
 before_action :post_image_params, only: [:create, :destroy]

 def create
  # お気に入り登録を作成する。ユーザーIDはログイン中ユーサーのIDを使用。投稿IDは取得した投稿IDを使用。
  Favorite.create(user_id: current_user.id, post_image_id: @post_image.id)
  # 投稿詳細画面にリダイレクトする
  redirect_to post_image_path(@post_image), notice: "お気に入り登録しました"
 end

 def destroy
  # ユーザーIDはログイン中ユーサーのIDを使用。投稿IDは取得した投稿IDを使用。
  favorite = Favorite.find_by(user_id: current_user.id, post_image_id: @post_image.id)
  # お気に入り登録を削除する
  favorite.destroy
  # 遷移元画面にリダイレクトする
  redirect_to request.referer, notice: "お気に入り登録を削除しました"
 end

 private

 # 投稿データのストロングパラメータ
 def post_image_params
  # レコードを1件取得
  @post_image = PostImage.find(params[:post_image_id])
 end
end
