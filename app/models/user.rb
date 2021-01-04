class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :orders
         enum admin: {normal: 0, staff:1}

         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to_active_hash :member

         validates :email,  presence: true
         validates :password,  presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
         validates :name,  presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
         validates :name_kana,  presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' } 
         validates :member_id,  numericality: { other_than: 0, message: 'Select'  }
end
