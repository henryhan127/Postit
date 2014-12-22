class CategoriesController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :require_admin, only: [:new, :create]
  def new
    @category = Category.new 
  end

	def create
		@category = Category.new(params.require(:category).permit(:name))
    if @category.save
      flash[:notice] = "A new category was created."

      redirect_to root_path
    else
      render :new
    end
  end

	def show
		@category = Category.find_by(slug: params[:id])
	end

end