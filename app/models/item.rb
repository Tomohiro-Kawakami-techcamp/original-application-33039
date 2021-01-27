class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price,    numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price_discrimination,    numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    end

  with_options numericality: { other_than: 0, message: 'Select'  } do
      validates :category_id 
      validates :delivery_id 
  end
end
