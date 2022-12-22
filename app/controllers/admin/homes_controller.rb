class Admin::HomesController < ApplicationController
 # ログイン認証が済んでいない場合、top画面にアクセス不可、ログイン画面に遷移する
 before_action :authenticate_admin!

 def top
  # 投稿データを全て取得し、1ページあたりの表示件数を「8件」に設定。投稿IDの降順に表示する。
  @post_images = PostImage.page(params[:page]).per(8).order(id: "DESC")
 end
end
