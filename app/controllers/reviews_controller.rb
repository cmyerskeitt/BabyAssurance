class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        if params[:baby_product_id] && @bp = BabyProduct.find_by(id: params[:id])
            @reviews = @bp.reviews
        else
            @error = "That baby product does not exist." if params[:post_id]
            @reviews = Review.all
        end 
    end
    
    def new
        binding.pry 
        if params[:baby_product_id] && @bp = BabyProduct.find_by(id: params[:id])
            @review = @bp.reviews.build
        else 
            @error = "That baby product doesn't exist" if params[:baby_product_id]
            @review = Review.new 
        end 
    end 

    def create 
        # binding.pry
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to reviews_path
        else
            render :new
        end
    end 

    def show 
    end 

    def edit 
    end 

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else 
            render :edit 
        end 
    end 

    private 

    def review_params
        params.require(:review).permit(:rating, :description, :baby_product_id) 
    end 
 

end
