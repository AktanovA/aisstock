class Product < ApplicationRecord
	belongs_to :customer
  belongs_to :supplier
	validates :title, presence: true,
                    length: { minimum: 4, maximum: 40}
  validates :quantity, :price, presence: true
  include AASM
  aasm do
    state :Заказ, :initial => true
    state :Принятие, :КонтрольКачества, :Размещенный, :Сборка, :Отправка, :ВозвратПоставщику, :Доставлено

    event :acceptance do
      transitions :from => :Заказ, :to => :Принятие
    end

    event :qualitycheck do
      transitions :from => :Принятие, :to => :КонтрольКачества
    end

    event :placed do
      transitions :from => :КонтрольКачества, :to => [:Размещенный, :ВозвратПоставщику]
    end

    event :assemblage do
      transitions :from => :Размещенный, :to => :Сборка
    end

    event :shipped do
      transitions :from => [:Сборка, :ВозвратПоставщику], :to => :Отправка
    end

    event :delivery do
      transitions :from => :Отправка, :to => :Доставлено
    end
  end

  scope :book, -> { where(aasm_state: 'Заказ') }
  scope :quality, -> { where(aasm_state: 'КонтрольКачества') }
  scope :place, -> { where(aasm_state: 'Размещенный') }
  scope :assembly, -> { where(aasm_state: 'Сборка') }
  scope :accept, -> { where(aasm_state: 'Принятие') }
  scope :shipment, -> { where(aasm_state: 'Отправка') }
  scope :return_to_supplier, -> { where(aasm_state: 'ВозвратПоставщику') }
  scope :transported, -> { where(aasm_state: 'Доставлено') }



    def totalprice
    	quantity * price
    end
	enum unit: [:Штук, :Кг]
end
