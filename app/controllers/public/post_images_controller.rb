class Public::PostImagesController < ApplicationController
  def new
   # 空のモデルを用意する
   @post_image = PostImage.new
  end

  def create
   # データを受け取り新規登録するインスタンス
   @post_image = PostImage.new(post_image_params)
   # 投稿者ID＝ログイン中ユーザー
   @post_image.user_id = current_user.id
   # データをデータベースに保存する
   @post_image.save
   # 保存後、投稿の詳細画面にリダイレクトする
   redirect_to post_image_path(@post_image.id)
  end

  def index
  end

  def show
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
   @user = @post_image.user
  end

  def edit
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
  end

  def update
  end

  def destroy
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
   # レコードを削除
   @post_image.destroy
   # レコードを削除後、投稿一覧画面にリダイレクトする
   redirect_to post_images_path
  end

  private
  # 投稿データのストロングパラメータ
  def post_image_params
   params.require(:post_image).permit(:user_id, :title, :body, :image)
  end

end
