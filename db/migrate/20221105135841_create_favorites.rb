class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      # ユーザーIDを保存するカラム
      t.integer :user_id, null: false
      # 投稿IDを保存するカラム
      t.integer :post_image_id, null: false
      t.timestamps
    end
  end
end
