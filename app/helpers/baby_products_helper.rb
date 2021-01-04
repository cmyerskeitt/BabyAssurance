module BabyProductsHelper
    def index_display_header
        if @user
          content_tag(:h1, "#{@user.username}'s Baby Products:")
        else
          content_tag(:h2, "All Baby Products")
        end
      end
    
      def display_baby_products
        if @user.baby_products.empty?
          tag.h2(link_to('No baby products yet - add a baby product here', new_baby_product_path))
        else
          user = @user == current_user ? 'You have' : "#{@user.username}'s"
          content_tag(:h2, "#{user} #{pluralize(@user.baby_products.count, 'Baby Products')}.")
    
        end
      end

end
