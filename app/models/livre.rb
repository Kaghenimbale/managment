class Livre < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :author, presence: true
end
