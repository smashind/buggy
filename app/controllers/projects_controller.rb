class ProjectsController < ApplicationController

	def index
		@projects = Project.all
		respond_to do |format|
			format.json { render json: @projects }
		end
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			respond_to do |format|
				format.json { render json: @project }
			end
		end
	end

	private

	  def project_params
	  	params.require(:project).permit(:name, :description)
	  end
end
