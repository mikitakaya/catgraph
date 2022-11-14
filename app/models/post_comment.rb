class PostComment < ApplicationRecord
  # post_comment（N）はuser（1）に属する
  belongs_to :user
  # post_comment（N）はpost_image（1）に属する
  belongs_to :post_image
end
