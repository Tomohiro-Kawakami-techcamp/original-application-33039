class Service < ApplicationRecord
  belongs_to :user

  validates :content,    presence: true
  validates :limit_day,  presence: true
  validates :target,     presence: true
  validates :release_day,  presence: true
end