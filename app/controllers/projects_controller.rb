class ProjectsController < ApplicationController
  before_filter :authenticated, only: [ :create ]
  before_filter :owner, only: [ :update, :destroy ]
	def index
		@projects = Project.all
	end

	def create
		project = Project.new(project_params)
	  if project.save
		  render json: project
		else
			render json: { errors: project.errors }, status: :unprocessable_entity
		end
	end

	def show
		@project = Project.includes(:issues).find(params[:id])
	end

	def destroy
		@project.destroy
		render json: @project
	end

	def update
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

	  def authenticated
	  	if cannot? :create, Project
	  		render status: :forbidden, text: "Forbidden"
	  	end
	  end

	  def owner
	  	@project = Project.find(params[:id])
	  	if cannot? params[:action].to_sym, @project
	  		render status: :forbidden, text: "Forbidden"
	  	end
	  end
end
