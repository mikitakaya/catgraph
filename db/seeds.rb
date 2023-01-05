# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
 email: "kanri@k.jp",
 password: "kanripass"
)

# user_id:1はゲストユーザーのため、user2から作成
users = User.create!(
  [
    # user_id:2 なぎさ
    {email: "nagisa@test.com", name: "なぎさ", username: "nagi_gisa", introduction: "我が家のチェルシーちゃん（ロシアンブルー）の写真を主にUPします", password: "nagisapass", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    # user_id:3 kuro
    {email: "kuro.111@test.com", name: "kuro", username: "kuro.111", introduction: "猫のジェラートといつも一緒。", password: "kurokuro", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    # user_id:4 エミ
    {email: "emiemi@test.com", name: "エミ", username: "emiko.mimi", password: "emikopass", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    # user_id:5 めがね
    {email: "megane.suki@test.com", name: "めがね", username: "megane_moe", introduction: "黒猫トト／三毛猫ネネ", password: "meganepass", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    # user_id:6 ゆら
    {email: "tamayura@test.com", name: "ゆら", username: "yura_tamayura", introduction: "近所の野良猫さんの写真をよく撮ります。猫ちゃんしか勝たん〜！！", password: "yurapass", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    # user_id:7 taro
    {email: "taro@test.com", name: "taro", username: "ta.taro", introduction: "見る専です。猫ちゃん癒しすぎる…", password: "taropass", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    # user_id:8 たみこ
    {email: "tami@test.com", name: "たみこ", username: "tamitami", introduction: "猫さんぽ", password: "tamipass", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")},
    # user_id:9 おむすび
    {email: "omusubi@test.com", name: "おむすび", username: "omu_subi", introduction: "NO CAT NO LIFE!!!!", password: "omupass", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")}
  ]
)

PostImage.create!(
  [
    # post_image_id:1 user_id:2 なぎさ
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), title: "食いしん坊さん！", body: "おやつのカニカマが大好きなチェルさん🦀口元にまだついてますよ〜😊", user_id: 2 },
    # post_image_id:2 user_id:3 kuro
    {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), title: "お昼寝", body: "毛布に包まって、ぽかぽかであったかいね", user_id: 3 },
    # post_image_id:3 user_id:2 なぎさ
    # {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), title: "困り顔", body: "ハロウィンが近かったので、リボンを付けたら八の字眉毛になっちゃいました🤭困らせちゃったけど、普段は見れない貴重な表情です💕", user_id: 2 },


    # {shop_name: 'Cavello', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: '大人気のカフェです。', user_id: users[0].id },
    # {shop_name: '和食屋せん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '日本料理は美しい！', user_id: users[1].id },
    # {shop_name: 'ShoreditchBar', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: 'メキシコ料理好きな方にオススメ！', user_id: users[2].id }
  ]
)