class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			respond_to do |format|
				format.json { render json: @project }
			end
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	private

	  def project_params
	  	params.require(:project).permit(:name, :description)
	  end
end
