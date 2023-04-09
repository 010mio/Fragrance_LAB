class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    pp "hoge",image.attached?
    (image.attached?) ? image : 'default-image2.jpg'
  end
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title","body"]
  end

end