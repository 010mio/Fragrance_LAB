# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@email.com" ,
  password: "admin123"
  )

tags = Tag.create!([
  { name: 'アロマ' },
  { name: 'シトラス' },
  { name: 'ハーブ' },
  { name: 'フローラル' },
  { name: 'レシピ' }
])

customers = Customer.create!(
  [
    {email: 'olivia@example.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@example.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@example.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Article.create!(
  [
    {title: 'ユーカリ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"), body: 'ユーカリはフトモモ科の植物です。', customer_id: customers[1].id, tag_id: tags[2].id },
    {title: 'カモミール', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), body: 'カモミールはキク科の植物です。', customer_id: customers[1].id, tag_id: tags[2].id },
    {title: 'アロマキャンドル', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg"), body: 'アロマキャンドルのレシピ', customer_id: customers[2].id, tag_id: tags[4].id },
    {title: 'オレンジ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), body: 'オレンジはミカン科の植物です。', customer_id: customers[1].id, tag_id: tags[1].id },
    {title: 'ローズ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), body: 'ローズはバラ科の植物です。', customer_id: customers[1].id, tag_id: tags[3].id },
    {title: 'ベルガモット', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), body: 'ベルガモットはミカン科の植物です。', customer_id: customers[1].id, tag_id: tags[1].id },
    {title: 'アロマスプレー', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg"), body: 'アロマスプレーのレシピ', customer_id: customers[2].id, tag_id: tags[4].id },
    {title: 'ラベンダー', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), body: 'ラベンダーはシソ科の植物です。', customer_id: customers[1].id, tag_id: tags[3].id },
    {title: 'アロマオイル', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg"), body: 'アロマオイルは、植物由来の香り成分を抽出したものです。', customer_id: customers[0].id, tag_id: tags[0].id  },
  ]
)