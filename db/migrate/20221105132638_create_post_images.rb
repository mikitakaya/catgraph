class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
     # ユーザーIDを保存するカラム
     t.integer :user_id, null: false
     # タイトルを保存するカラム
     t.string :title, null: false
     # 説明を保存するカラム
     t.text :body, null: false
     t.timestamps
    end
  end
end
