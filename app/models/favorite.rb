class Favorite < ApplicationRecord
  # favorite（N）はpost_image（1）に属する
  belongs_to :post_image
end
