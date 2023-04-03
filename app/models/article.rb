class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations, dependent: :destroy
end