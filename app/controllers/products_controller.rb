class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update delete destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def update
    @product = Product.find(params[:id])
    @product_id = @product.id 
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
 

  # POST /products or /products.json
  def create
    @product = Product.create(product_params)
    @product_id = @product.id 
    respond_to do |format|
        if @product.save 
          format.html {redirect_to @product, notice: "Product was successfully listed." }
          format.json {render :show, status: :created, location: @product}
        else
          format.json {render json: @product.errors, status: :unprocessable_entity }
        end
    end
  end



  # Allows product to be deleted and then redirects to index page of shop
  def destroy
    @product = Product.find(params[:id]).delete
    respond_to do |format|
        if @product.delete
          format.html {redirect_to @product, notice: "Product was successfully deleted." }
        else
          format.json {render json: @product.errors, status: :unprocessable_entity }
        end
    end
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_products
      @products = Product.all
    end
  
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :category, :image_url, :buyer_id, :seller_id)
    end
  

    #stripe payment feature 
    def generate_stripe_session
      session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @product.title,
          description: @product.description,
          amount: @product.price,
          currency: 'aud',
          quantity: 1,
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.id,
              product_id: @product.id
          }
      },
      success_url: "#{root_url}payments/success?productId=#{product.id}",
      cancel_url: "#{root_url}products"
    )

    @session_id = session.id
    end

end