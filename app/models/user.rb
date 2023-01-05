class User < ApplicationRecord
 # Include default devise modules. Others available are:
 # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

 # プロフィール画像を「profile_image」というカラムで保存
 has_one_attached :profile_image, dependent: :destroy
 # userが削除された際、post_image・post_comment・favoriteも削除される
 # user（1）はpost_image（N）を複数持っている
 has_many :post_images, dependent: :destroy
 # user（1）はpost_comment（N）を複数持っている
 has_many :post_comments, dependent: :destroy
 # user（1）はfavorite（N）を複数持っている
 has_many :favorites, dependent: :destroy
 has_many :favorited_post_images, through: :favorites, source: :post_image

 # フォローをした、されたの関係
 has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

 # 一覧画面で使用
 has_many :followings, through: :relationships, source: :followed
 has_many :followers, through: :reverse_of_relationships, source: :follower

 VALID_PASSWORD_REGEX = /\A[!-~]+\z/
 # nameとusernameのデータは存在しなければならない、かつ一意性を持たせる
 # nameは2～50文字の範囲で制限する
 validates :name, presence: true, uniqueness: true, length: { in: 2..50 }
 # usernameは6～20文字の範囲で制限する
 validates :username, presence: true, uniqueness: true, length: { in: 6..20 }, format: { with: VALID_PASSWORD_REGEX }
 # introductionは最大140文字に制限する
 validates :introduction, length: { maximum: 140 }

 def self.guest
  find_or_create_by!(name: 'ゲスト' ,email: 'cg_guest@example.com') do |user|
   user.password = SecureRandom.urlsafe_base64
   user.name = "ゲスト"
   user.username = "Catgraph_gest"
   user.introduction = "ゲストアカウントです。新規投稿や投稿閲覧（一部）に制限がかかっています。"
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

 # フォローをする
 def follow(user_id)
  relationships.create(followed_id: user_id)
 end

 # フォローを外す
 def unfollow(user_id)
  relationships.find_by(followed_id: user_id).destroy
 end

 # フォローをしているか判定
 def following?(user)
  followings.include?(user)
 end

 # wordに基づいて検索する
 def self.search(word)
  # wordは未設定の場合（unless word）、全ユーザー情報を返します（return User.all）
  return User.all unless word
  # 検索結果に「ゲスト」は含まない（where.not(name: "ゲスト")）、ステータスが退会の場合も含まない
  User.where("name LIKE?","%#{word}%").where.not(name: "ゲスト").where.not(is_deleted: true)
 end

end