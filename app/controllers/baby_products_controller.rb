class BabyProductsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @bp = BabyProduct.all
    end 

    def new 
        @bp = BabyProduct.new 
    end 

end
