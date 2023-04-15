class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, dependent: :destroy


  def get_image
    pp "hoge",image.attached?
    (image.attached?) ? image : 'default-image2.jpg'
  end
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags
    p current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
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
