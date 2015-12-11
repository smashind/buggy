class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def create
		@project = Project.new(project_params)
	  if @project.save
		  render json: @project
		else
			render json: { errors: @project.errors }, status: :unprocessable_entity
		end
	end

	def show
		@project = Project.includes(:issues).find(params[:id])
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		render json: @project
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
		  render json: @project
		else
			render json: { errors: @project.errors }, status: :unprocessable_entity
		end
	end

	private

	  def project_params
	  	params.require(:project).permit(:name, :description)
	  end
end
