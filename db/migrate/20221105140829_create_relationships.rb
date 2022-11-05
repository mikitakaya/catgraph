class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      # フォローするユーザーのIDを保存するカラム
      t.integer :follower_id, null: false
      # フォローされるユーザーのIDを保存するカラム
      t.integer :followed_id, null: false
      t.timestamps
    end
  end
end
