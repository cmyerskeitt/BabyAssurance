class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:show, :edit, :update]
    before_action :redirect_if_not_review_user, only: [:edit, :update]

    def index
        # binding.pry
        if params[:baby_product_id] && @bp = BabyProduct.find_by_id(params[:baby_product_id])
            @reviews = @bp.reviews
        else
            @error = "That baby product does not exist." if params[:baby_product_id]
            @reviews = Review.all
        end 
    end
    
    def new
        # binding.pry 
        if params[:baby_product_id] && @bp = BabyProduct.find_by_id(params[:baby_product_id])
            @review = @bp.reviews.build
        else 
            @error = "That baby product doesn't exist" if params[:baby_product_id]
            @review = Review.new 
        end 
    end 

    def create 
        @review = current_user.reviews.build(review_params)
        # binding.pry
        if @review.save
            redirect_to reviews_path(@review)
        else
            render :new
        end
    end 

    def show 
    end 

    def edit 
    end 

    def update
        # binding.pry
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

    def set_review
        @review = Review.find_by_id(params[:id])
        if !@review
            flash[:message] = "Review was not found"
            redirect_to reviews_path
        end 
    end 

    def redirect_if_not_review_user
        redirect_to reviews_path if @review.user != current_user
    end 

end
