class Favorite < ApplicationRecord
  # favorite（N）はuser（1）に属する
  belongs_to :user
  # favorite（N）はpost_image（1）に属する
  belongs_to :post_image
  # 1つの投稿に対して、1つしかいいねをつけられない
  validates_uniqueness_of :post_image_id, scope: :user_id
end
