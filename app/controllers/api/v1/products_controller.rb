class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def show
    product = Product.find_by(id: params[:id])

    if product
      render json: product, status: 200
    else
      render json: { error: 'Product not found!' }
    end
  end

  def create
    product = Product.new(
      name: prod_params[:name],
      description: prod_params[:description],
      price: prod_params[:price],
      currency: prod_params[:currency],
      rating: 0,
      colors: prod_params[colors],
      sizes: prod_params[sizes],
      count: prod_params[count],
      noOfSales: 0
    )

    if product.save
      render json: product, status: 200
    else
      render json: { error: 'Error creating product!' }
    end
  end

  private

  def prod_params
    params.require(:product).permit([
        :name,
        :description,
        :price,
        :currency,
        :colors,
        :sizes,
        :count
    ])
  end
end
