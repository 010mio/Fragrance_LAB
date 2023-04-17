class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :article_tag_relations, dependent: :destroy
  has_many :tags, through: :article_tag_relations,  dependent: :destroy


  def get_image
    pp "hoge",image.attached?
    (image.attached?) ? image : 'default-image2.jpg'
  end
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @article = Article.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @article = Article.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @article = Article.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @article = Article.where("title LIKE?","%#{word}%")
    else
      @article = Article.all
    end
  end
end
