class Public::PostImagesController < ApplicationController
  before_action :set_user, only: [:new, :index]

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
   # 1ページあたりの表示件数を「8件」に設定
   @post_images = PostImage.page(params[:page]).per(8)
  end

  def show
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
   # ユーザー＝投稿したユーザー
   @user = @post_image.user
   # 空のモデルを用意する
   @post_comment = PostComment.new
  end

  def edit
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
  end

  def update
   # レコードを1件だけ取得
   @post_image = PostImage.find(params[:id])
   # データを更新する
   @post_image.update(post_image_params)
   # 更新後、投稿詳細画面にリダイレクトする
   redirect_to post_image_path(@post_image.id)
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

  def set_user
   @user = current_user
  end

  # 投稿データのストロングパラメータ
  def post_image_params
   params.require(:post_image).permit(:user_id, :title, :body, :image)
  end

end
