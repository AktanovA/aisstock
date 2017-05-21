class ProductsController < ApplicationController
	
	def index
		@products = Product.all
		respond_to do |format|
  		format.html
  		format.pdf do
    		render  pdf: "report"
  		end
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end
	
	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to @product
		else
			render '/products/new'
		end
	end

	def update
 		@product = Product.find(params[:id])
 
 		if @product.update(product_params)
   			redirect_to @product
  		else
    		render '/products/new'
  		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_path
	end

	private
  		def product_params
    		params.require(:product).permit(:title, :quantity, :price, :sum, :comment, :supplier_id, :customer_id, :unit, :aasm_state, :state)
		end
end
