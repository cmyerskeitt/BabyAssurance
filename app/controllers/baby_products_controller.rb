class BabyProductsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @bps = @user.baby_products
        else
            @error = "That user doesn't exist" if params[:user_id]
            @bps = BabyProduct.all
        end 
    end 

    def new 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @bp = @user.baby_products.build
        else 
            @bp = BabyProduct.new
        end 
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

    def edit 
        @bp = BabyProduct.find_by(id: params[:id])
        redirect_to baby_products_path of !@bp || @bp.user != current_user
    end 

    def update 
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
