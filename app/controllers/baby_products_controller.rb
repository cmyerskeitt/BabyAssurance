class BabyProductsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @bps = BabyProduct.all
    end 

    def new 
        @bp = BabyProduct.new 
    end 

    def create
        # binding.pry 
        @bp = current_user.baby_products.build(baby_product_params)
        if @bp.save
            redirect_to baby_products_path
        else
            render :new  
        end
    end 

    def show 
        @bp = BabyProduct.find_by_id(params[:id])
        redirect_to baby_products_path if !@bp
    end 

    private 

    def baby_product_params 
        params.require(:baby_product).permit(:name, :price, :product_type, :url)
    end 



end
