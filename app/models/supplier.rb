class Supplier < ApplicationRecord
	    validates :title, :address, presence: true
end
