class Service < ApplicationRecord
  belongs_to :user

  validates :content,    presence: true
  validates :limit_day,  presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "input correctly" }
  validates :target,     presence: true
  validates :release_day,  presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "input correctly" }
end