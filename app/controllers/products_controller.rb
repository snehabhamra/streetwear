class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update delete ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def update
  end

  # POST /products or /products.json
  def create
    @product = Product.create 
    @picture = current_user.picture.new(picture_params)
    @product_id = @product.id 
      if @product.save && @picture.save
        render :show, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end

    end
  end


  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :category, :image_url, :buyer_id, :seller_id)
    end
