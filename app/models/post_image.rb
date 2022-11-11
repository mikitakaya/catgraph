class PostImage < ApplicationRecord
  # 投稿画像を「image」というカラムで保存
  has_one_attached :image
  # post_image（N）はuser（1）に属する
  belongs_to :user
  # post_imageが削除された際、post_comment・favoriteも削除される
  # post_image（1）はpost_comment（N）を複数持っている
  has_many :post_comments, dependent: :destroy
  # post_image（1）はfavorite（N）を複数持っている
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
