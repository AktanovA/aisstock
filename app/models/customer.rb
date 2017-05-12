class Customer < ApplicationRecord
	validates :title, :address, :tin, presence: true
end
