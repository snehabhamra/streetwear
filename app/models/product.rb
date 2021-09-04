class Product < ApplicationRecord
    belongs_to :buyer, :optional => true
    belongs_to :seller, :optional => true
    has_one_attached :picture
end
