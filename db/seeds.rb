# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Admin.create!(
  # email: "admin@email.com" ,
  # password: "admin123"
  # )
# Customer.create!(
  # name: "ゲスト",
  # email: "guest@email.com" ,
  # password: "guest123"
  # )
# Tag.create([
  # { name: 'アロマ' },
  # { name: 'シトラス' },
  # { name: 'ハーブ' },
  # { name: 'フローラル' },
  # { name: 'レシピ' }
#])
#Article.create!(
# customer_id: 2,                                             
# title: 'テスト2',                                                   
# body: 'テスト2',                                                    
# )
ArticleTagRelation.create!(
  article_id: (Article.last.id - 1),
  tag_id: (Tag.last.id - 1),
  )