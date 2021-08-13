class Product < ApplicationRecord
    belongs_to :buyer, :optional => true
    belongs_to :seller 
    has_one_attached :picture
end
