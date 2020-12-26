class ReviewsController < ApplicationController
    def index
        if params[:baby_product_id] && @bp = BabyProduct.find_by(id: params[:id])
            @reviews = @bp.reviews
        else
            @error = "That baby product does not exist." if params[:post_id]
            @reviews = Review.all
        end 
    end
    
    def new
        @review = Review.new
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
        @review = Review.find_by(id: params[:id])
    end 

    def edit 
        @review = Review.find_by(id: params[:id])
    end 

    def update
        @review = Review.find_by(id: params[:id])
    end 

    private 

    def review_params
        params.require(:review).permit(:rating, :description, :baby_product_id) 
    end 

end
