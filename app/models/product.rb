class Product < ApplicationRecord
    belongs_to :user, :optional => true
    belongs_to :buyer, :optional => true
    belongs_to :seller, :optional => true
    has_many_attached :image_urls
end
