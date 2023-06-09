class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true

def get_profile_image
  (profile_image.attached?) ? profile_image : 'default-image.jpg'
end

def self.guest
  find_or_create_by!(email: 'guest@email.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.name = "ゲスト"
  end
end

end