class Product < ApplicationRecord
	
	validates :title, presence: true,
                    length: { minimum: 4, maximum: 25}
  validates :quantity, :price, :supplier, presence: true

  include AASM
  aasm do
    state :ordering, :initial => true
    state :accepting, :quality_checking, :placing, :assembling, :shipping, :returning_to_supplier

    event :acceptance do
      transitions :from => :ordering, :to => :accepting
    end

    event :qualitycheck do
      transitions :from => :accepting, :to => :quality_checking
    end

    event :placed do
      transitions :from => :quality_checking, :to => [:placing, :returning_to_supplier]
    end

    event :assemblage do
      transitions :from => :placing, :to => :assembling
    end

    event :shipped do
      transitions :from => [:assembling, :returning_to_supplier], :to => :shipping
    end
  end

    def totalprice
    	quantity * price
    end
	enum unit: [:Pieces, :Kg]
end
