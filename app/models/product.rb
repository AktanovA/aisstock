class Product < ApplicationRecord
	belongs_to :customer
  belongs_to :supplier
	validates :title, presence: true,
                    length: { minimum: 4, maximum: 25}
  validates :quantity, :price, presence: true
  include AASM
  aasm do
    state :ordering, :initial => true
    state :accepting, :quality_checking, :placing, :assembling, :shipping, :returning_to_supplier, :delivered

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

    event :delivery do
      transitions :from => :shipping, :to => :delivered
    end
  end

  scope :book, -> { where(aasm_state: 'ordering') }
  scope :quality, -> { where(aasm_state: 'quality_checking') }
  scope :place, -> { where(aasm_state: 'placing') }
  scope :assembly, -> { where(aasm_state: 'assembling') }
  scope :accept, -> { where(aasm_state: 'accepting') }
  scope :shipment, -> { where(aasm_state: 'shipping') }
  scope :return_to_supplier, -> { where(aasm_state: 'returning_to_supplier') }
  scope :transported, -> { where(aasm_state: 'delivered') }



    def totalprice
    	quantity * price
    end
	enum unit: [:Pieces, :Kg]
end
