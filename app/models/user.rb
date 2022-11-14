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
  has_many :favorited_post_images, through: :likes, source: :post

  def self.guest
    find_or_create_by!(name: 'ゲスト' ,email: 'cg_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.username = "Catgraph_gest"
    end
  end

  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/default-image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(post_image_id)
   favorites.where(post_image_id: post_image_id).exists?
  end

  # ステータス true:退会、false:有効
  enum is_deleted: { no_active: true, active: false}
end
