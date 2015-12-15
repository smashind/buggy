class IssuesController < ApplicationController

	def create
		@issue = Issue.new(issue_params)
		unless @issue.save
	  	render json: { errors: @issue.errors }, status: :unprocessable_entity
	  end
	end

	private

	  def issue_params
	  	params.require(:issue).permit(:name, :description, :project_id)
	  end

end