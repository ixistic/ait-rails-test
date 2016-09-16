class Book < ApplicationRecord
  belongs_to :category
  validates_presence_of :name, :price
  validates_uniqueness_of :name
end
