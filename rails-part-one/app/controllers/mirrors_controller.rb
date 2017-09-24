class MirrorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
  	@mirrors = Mirror.all
  end 

  def show
  	@mirror = Mirror.find(params[:id])
  end

  def new
  end

  def edit
  	@mirror = Mirror.find(params[:id])
  end

  def create
  	@mirror = Mirror.new(article_params)
  	 
  	@mirror.save
  	redirect_to @mirror
  end

  def update
  	@mirror = Mirror.find(params[:id])
  	 
  	  if @mirror.update(mirror_params)
  	    redirect_to @mirror
  	  else
  	    render 'edit'
  	  end
  end

  def destroy
    @mirror = Mirror.find(params[:id])
    @mirror.destroy
   
    redirect_to mirrors_path
  end

  def activities
    @mirror = Mirror.find(params[:id])
    output = {}
    @mirror.members.each do |member|
      output[member.first_name] = member.activity
    end
    render json: output
  end

  private
  	def article_params
  		params.require(:mirror).permit(:codename)
  	end
end
