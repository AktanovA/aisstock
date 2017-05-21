class Supplier < ApplicationRecord
	validates :title, :address, :comment, presence: true
	has_many :products
end
