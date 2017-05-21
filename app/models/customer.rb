class Customer < ApplicationRecord
	validates :title, :address, :tin, presence: true
	has_many :products
end
