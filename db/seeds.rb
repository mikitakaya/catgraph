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
_user1 = User.create!({email: 'cg_guest@example.com', name: 'ゲスト', username: 'Catgraph_gest', introduction: "ゲストアカウントです。\n新規投稿や投稿閲覧（一部）に制限がかかっています。", password: SecureRandom.urlsafe_base64 }),
# user_id:2 なぎさ
user2 = User.create!({email: 'nagisa@test.com', name: 'なぎさ', username: 'nagi_gisa', introduction: '我が家のチェルシーちゃん（ロシアンブルー）の写真を主にUPします', password: 'nagisapass', id: 2, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")}),
# user_id:3 kuro
user3 = User.create!({email: 'kuro.111@test.com', name: 'kuro', username: 'kuro.111', introduction: '猫のジェラートといつも一緒。', password: 'kuropass', id: 3, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}),
# user_id:4 エミ ステータス:退会済み
_user4 = User.create!({email: 'emiemi@test.com', name: 'エミ', username: 'emiko.mimi', password: 'emikopass', is_deleted: true, id: 4 }),
# user_id:5 めがね
user5 = User.create!({email: 'megane.suki@test.com', name: 'めがね', username: 'megane_moe', introduction: '黒猫トト／三毛猫ネネ', password: 'meganepass', id: 5, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")}),
# user_id:6 ひまり
user6 = User.create!({email: 'himari@test.com', name: 'ひまり', username: 'himamamari', password: 'himaripass', id: 6, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")}),
# user_id:7 taro
user7 = User.create!({email: 'taro@test.com', name: 'taro', username: 'ta.taro', introduction: '見る専です。猫ちゃん癒しすぎる…', password: 'taropass', id: 7, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")}),
# user_id:8 たみこ
user8 = User.create!({email: 'tami@test.com', name: 'たみこ', username: 'tamitami', introduction: '猫さんぽ', password: 'tamipass', id: 8, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")}),
# user_id:9 おむすび
user9 = User.create!({email: 'omusubi@test.com', name: 'おむすび', username: 'omu_subi', introduction: 'NO CAT NO LIFE!!!!', password: 'omupass', id: 9, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")}),
# user_id:10 ゆら
user10 = User.create!({email: 'tamayura@test.com', name: 'ゆら', username: 'yura_tamayura', introduction: "近所の野良猫さんの写真をよく撮ります。\n猫ちゃんしか勝たん〜！！", password: 'yurapass', id: 10, profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")})


# post_image_id:1 user_id:2 なぎさ
post_image1 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), title: '食いしん坊さん！', body: "おやつのカニカマが大好きなチェルさん🦀\n口元にまだついてますよ〜😊", user_id: user2.id }),
# post_image_id:2 user_id:3 kuro
post_image2 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), title: 'お昼寝', body: '毛布に包まって、ぽかぽかであったかいね', user_id: user3.id }),
# post_image_id:3 user_id:2 なぎさ
post_image3 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), title: '困り顔', body: "ハロウィンが近かったので、リボンを付けたら八の字眉毛になっちゃいました🤭\n困らせちゃったけど、普段は見れない貴重な表情です💕", user_id: user2.id }),
# post_image_id:4 user_id:10 ゆら
post_image4 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), title: '引っ越したらご挨拶が😳', body: "引越し当日に野良猫さんがご挨拶に来てくれました！\nこちらに興味津々で可愛かったです😚", user_id: user10.id }),
# post_image_id:5 user_id:8 たみこ
post_image5 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), title: '花見帰りに…', body: "昼過ぎに散歩を始めて出会った野良猫さん\nカメラを見てくれなかったけど、写真は撮らせてくれました\nありがとう🌸", user_id: user8.id }),
# post_image_id:6 user_id:3 kuro
post_image6 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"), title: 'おはよう', body: 'つぶらな瞳がかわいいね', user_id: user3.id }),
# post_image_id:7 user_id:2 なぎさ
post_image7 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg"), title: '初めてのセミ', body: 'セミにびっくりしすぎて、固まってる🤣ww', user_id: user2.id }),
# post_image_id:8 user_id:10 ゆら
post_image8 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg"), title: 'お出迎え', body: "お仕事が終わって帰宅すると…\nご近所の野良猫さんが玄関で待ってました！\n可愛いーー！！", user_id: user10.id }),
# post_image_id:9 user_id:2 なぎさ
post_image9 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg"), title: 'あのぉ…', body: "可愛いんだけども、勉強に使いたいので\nノートを返してくださいな🥹", user_id: user2.id }),
# post_image_id:10 user_id:3 kuro
post_image10 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg"), title: 'うとうと', body: 'おねむさん💤', user_id: user3.id }),
# post_image_id:11 user_id:2 なぎさ
post_image11 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post11.jpg"), filename:"sample-post11.jpg"), title: 'お片付け邪魔し隊', body: "段ボールを片付けてると、必ずやってくるのが\nお片付け邪魔し隊のチェルシー隊員です🤓", user_id: user2.id }),
# post_image_id:12 user_id:2 なぎさ
post_image12 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg"), title: 'よぉく見てみると👀', body: "キリッと表情は決まっておりますが、\n口元にカリカリがくっついてますよ😉", user_id: user2.id }),
# post_image_id:13 user_id:2 なぎさ
post_image13 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post13.jpg"), filename:"sample-post13.jpg"), title: '葉っぱ好き🌱', body: "スーパーから帰ってきて、荷物から目を離したら…\n葉っぱハンターにかぶの葉を食べられていました🤣", user_id: user2.id }),
# post_image_id:14 user_id:10 ゆら
post_image14 = PostImage.create!({image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post14.jpg"), filename:"sample-post14.jpg"), title: 'いつでも仲良し', body: "暗闇に見覚えのある影が！\n今日も仲良しさんだね〜🤭💕", user_id: user10.id })


PostComment.create!(
 [
  # post_image_id:7 user_id:3 kuro
  {comment: '夏らしい、とても良い写真ですね', post_image_id: post_image7.id, user_id: user3.id },
  # post_image_id:7 user_id:2 なぎさ
  {comment: "kuroさん ありがとうございます😊\n私自身も初めてセミを見たので、一緒に固まっちゃいましたw", post_image_id: post_image7.id, user_id: user2.id },

  # post_image_id:8 user_id:5 めがね
  {comment: 'お家の中にご招待したくなっちゃいますね！', post_image_id: post_image8.id, user_id: user5.id },
  # post_image_id:8 user_id:10 ゆら
  {comment: "めがねさん そうなんです！\nでも賃貸なので、我慢です…(>_<)", post_image_id: post_image8.id, user_id: user10.id },

  # post_image_id:13 user_id:7 taro
  {comment: '躍動感がスゴイっすねwww', post_image_id: post_image13.id, user_id: user7.id },
  # post_image_id:13 user_id:2 なぎさ
  {comment: '我ながら、なかなかいい写真が撮れました😏',  post_image_id: post_image13.id, user_id: user2.id },
  # post_image_id:13 user_id:7 taro
  {comment: '葉っぱを押さえつけようとしてる右手が良いですね〜😎',  post_image_id: post_image13.id, user_id: user7.id }
 ]
)

Favorite.create!(
 [
  # user_id:2 なぎさ
  {user_id: user2.id, post_image_id: post_image2.id},
  {user_id: user2.id, post_image_id: post_image5.id},
  {user_id: user2.id, post_image_id: post_image4.id},
  {user_id: user2.id, post_image_id: post_image1[0].id},
  {user_id: user2.id, post_image_id: post_image3.id},
  {user_id: user2.id, post_image_id: post_image6.id},
  {user_id: user2.id, post_image_id: post_image8.id},
  {user_id: user2.id, post_image_id: post_image10.id},
  {user_id: user2.id, post_image_id: post_image14.id},

  # user_id:3 kuro
  {user_id: user3.id, post_image_id: post_image1[0].id},
  {user_id: user3.id, post_image_id: post_image4.id},
  {user_id: user3.id, post_image_id: post_image3.id},
  {user_id: user3.id, post_image_id: post_image5.id},
  {user_id: user3.id, post_image_id: post_image7.id},
  {user_id: user3.id, post_image_id: post_image13.id},

  # user_id:5 めがね
  {user_id: user5.id, post_image_id: post_image3.id},
  {user_id: user5.id, post_image_id: post_image8.id},
  {user_id: user5.id, post_image_id: post_image1[0].id},
  {user_id: user5.id, post_image_id: post_image13.id},
  {user_id: user5.id, post_image_id: post_image14.id},

  # user_id:6 ひまり
  {user_id: user6.id, post_image_id: post_image7.id},
  {user_id: user6.id, post_image_id: post_image3.id},
  {user_id: user6.id, post_image_id: post_image11.id},
  {user_id: user6.id, post_image_id: post_image13.id},

  # user_id:7 taro
  {user_id: user7.id, post_image_id: post_image5.id},
  {user_id: user7.id, post_image_id: post_image13.id},
  {user_id: user7.id, post_image_id: post_image1[0].id},
  {user_id: user7.id, post_image_id: post_image2.id},
  {user_id: user7.id, post_image_id: post_image4.id},
  {user_id: user7.id, post_image_id: post_image6.id},
  {user_id: user7.id, post_image_id: post_image3.id},
  {user_id: user7.id, post_image_id: post_image7.id},
  {user_id: user7.id, post_image_id: post_image10.id},
  {user_id: user7.id, post_image_id: post_image9.id},
  {user_id: user7.id, post_image_id: post_image8.id},

  # user_id:8 たみこ
  {user_id: user8.id, post_image_id: post_image1[0].id},
  {user_id: user8.id, post_image_id: post_image4.id},
  {user_id: user8.id, post_image_id: post_image8.id},
  {user_id: user8.id, post_image_id: post_image7.id},
  {user_id: user8.id, post_image_id: post_image9.id},
  {user_id: user8.id, post_image_id: post_image13.id},

  # user_id:9 おむすび
  {user_id: user9.id, post_image_id: post_image14.id},
  {user_id: user9.id, post_image_id: post_image8.id},
  {user_id: user9.id, post_image_id: post_image4.id},
  {user_id: user9.id, post_image_id: post_image13.id},
  {user_id: user9.id, post_image_id: post_image7.id},
  {user_id: user9.id, post_image_id: post_image11.id},

  # user_id:10 ゆら
  {user_id: user10.id, post_image_id: post_image13.id},
  {user_id: user10.id, post_image_id: post_image12.id},
  {user_id: user10.id, post_image_id: post_image11.id},
  {user_id: user10.id, post_image_id: post_image5.id},
  {user_id: user10.id, post_image_id: post_image9.id},
  {user_id: user10.id, post_image_id: post_image7.id},
  {user_id: user10.id, post_image_id: post_image10.id},
  {user_id: user10.id, post_image_id: post_image6.id},
  {user_id: user10.id, post_image_id: post_image3.id},
  {user_id: user10.id, post_image_id: post_image1[0].id},
  {user_id: user10.id, post_image_id: post_image2.id}
 ]
)

# フォローされる側 user2:なぎさ
# フォローする側 user3:kuro（最初のフォロワー）、user6:ひまり、user5:めがね、user8:たみこ、user7:taro、user9:おむすび、user10:ゆら
user2.followers << user3
user2.followers << user6
user2.followers << user5
user2.followers << user8
user2.followers << user7
user2.followers << user9
user2.followers << user10
user2.save

# フォローされる側 user3:kuro
# フォローする側 user2:なぎさ（最初のフォロワー）、user7:taro、user5:めがね、user10:ゆら
user3.followers << user2
user3.followers << user7
user3.followers << user5
user3.followers << user10
user3.save

# フォローされる側 user5:めがね
# フォローする側 user2:なぎさ（最初のフォロワー）、user3:kuro、user10:ゆら、user9:おむすび
user5.followers << user2
user5.followers << user3
user5.followers << user10
user5.followers << user9
user5.save

# フォローされる側 user6:ひまり
# フォローする側 user2:なぎさ
user6.followers << user2
user6.save

# フォローされる側 user7:taro
# フォローする側 user2:なぎさ（最初のフォロワー）、user3:kuro、user8:たみこ
user7.followers << user2
user7.followers << user3
user7.followers << user8
user7.save

# フォローされる側 user8:たみこ
# フォローする側 user7:taro（最初のフォロワー）、user2:なぎさ、user10:ゆら
user8.followers << user7
user8.followers << user2
user8.followers << user10
user8.save

# フォローされる側 user9:おむすび
# フォローする側 user5:めがね（最初のフォロワー）、user2:なぎさ、user10:ゆら
user9.followers << user5
user9.followers << user2
user9.followers << user10
user9.save

# フォローされる側 user10:ゆら
# フォローする側 user9:おむすび（最初のフォロワー）、user8:たみこ、user3:kuro、user5:めがね、user2:なぎさ、user7:taro
user10.followers << user9
user10.followers << user8
user10.followers << user3
user10.followers << user5
user10.followers << user2
user10.followers << user7
user10.save