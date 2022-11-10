class PostImage < ApplicationRecord
  # 投稿画像を「image」というカラムで保存
  has_one_attached :image
  # post_image（N）はuser（1）に属する
  belongs_to :user
end
