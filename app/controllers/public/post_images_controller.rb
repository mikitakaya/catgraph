class Public::PostImagesController < ApplicationController
 before_action :correct_user, only: [:edit, :update]

 def new
  # 空のモデルを用意する
  @post_image = PostImage.new
 end

 def create
  # データを受け取り新規登録するインスタンス
  @post_image = PostImage.new(post_image_params)
  # 投稿者ID＝ログイン中ユーザーID
  @post_image.user_id = current_user.id
  # データをデータベースに保存する
  if @post_image.save
   # 保存後、投稿の詳細画面にリダイレクトする
   redirect_to post_image_path(@post_image.id), notice: '新規投稿に成功しました'
  else
   render :new
  end
 end

 def index
  # 1ページあたりの表示件数を「8件」に設定
  @post_images = PostImage.page(params[:page]).per(8).order(id: "DESC")
 end

 def show
  # レコードを1件取得
  @post_image = PostImage.find(params[:id])
  # ユーザー＝投稿したユーザー
  @user = @post_image.user
  # 空のモデルを用意する
  @post_comment = PostComment.new
 end

 def edit
  # レコードを1件取得
  @post_image = PostImage.find(params[:id])
 end

 def update
  # レコードを1件取得
  @post_image = PostImage.find(params[:id])
  # データを更新する
  if @post_image.update(post_image_params)
   # 更新後、投稿詳細画面にリダイレクトする
   redirect_to post_image_path(@post_image.id), notice: "投稿内容を更新しました"
  else
   render :edit
  end
 end

 def destroy
  # レコードを1件取得
  @post_image = PostImage.find(params[:id])
  # 投稿者ID＝ログイン中ユーザーIDですか
  if @post_image.user_id == current_user.id
   # レコードを削除
   @post_image.destroy
   # レコードを削除後、投稿一覧画面にリダイレクトする
   redirect_to post_images_path, notice: "投稿を削除しました"
  else
   # 投稿したユーザーとログイン中ユーザーが不一致の場合
   redirect_to post_images_path, notice: "他人の投稿は削除できません"
  end
 end

 def search
  @post_images = PostImage.search(params[:word])
 end

 private

 # 投稿データのストロングパラメータ
 def post_image_params
  params.require(:post_image).permit(:user_id, :title, :body, :image)
 end

 def correct_user
  # レコードを1件取得
  @post_image = PostImage.find(params[:id])
  # 投稿したユーザー
  @user = @post_image.user
  # 投稿したユーザーとログイン中ユーザーが不一致の場合、投稿一覧画面にリダイレクトする
  redirect_to(post_images_path) unless @user == current_user
 end
end