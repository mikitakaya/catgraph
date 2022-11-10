class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # プロフィール画像を「profile_image」というカラムで保存
  has_one_attached :profile_image
  # userが削除された際、post_image・post_comment・favoriteも削除される
  # user（1）はpost_image（N）を複数持っている
  has_many :post_images, dependent: :destroy
  # user（1）はpost_comment（N）を複数持っている
  has_many :post_comments, dependent: :destroy
  # user（1）はfavorite（N）を複数持っている
  has_many :favorites, dependent: :destroy

  def self.guest
    find_or_create_by!(name: 'ゲスト' ,email: 'cg_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.username = "Catgraph_gest"
    end
  end

end
