class Product < ApplicationRecord
	validates :title, presence: true,
                    length: { minimum: 4, maximum: 25}
    validates :quantity, :price, :supplier, presence: true
	
	enum unit: [:Pieces, :Kg]
end
