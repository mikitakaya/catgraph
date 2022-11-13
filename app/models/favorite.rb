class Favorite < ApplicationRecord
  # favorite（N）はuser（1）に属する
  belongs_to :user
  # favorite（N）はpost_image（1）に属する
  belongs_to :post_image
end
