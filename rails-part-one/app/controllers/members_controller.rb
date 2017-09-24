class MembersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
	    @mirror = Mirror.find(params[:mirror_id])
	    @member = @mirror.members.create(member_params)
	    redirect_to mirror_path(@mirror)
	end

	def destroy
	    @mirror = Mirror.find(params[:mirror_id])
	    @member = @mirror.members.find(params[:id])
	    @member.destroy
	    redirect_to mirror_path(@mirror)
	 end

	private
	def member_params
	  params.require(:member).permit(:first_name, :last_name, :activity)
	end
end
