class TasksController < ApplicationController

	before_filter :authenticate_user!
	respond_to :html, :xml, :json

	def index
		@tasks = current_user.tasks
		@task = Task.new
		respond_with @tasks, @task
	end

	def show
	end

	def new
		@task = current_user.tasks.new
		@tasks = current_user.tasks
		respond_with @task
	end

	def create 
		@task = current_user.tasks.build(params[:task])
		@tasks = current_user.tasks
			if @task.save
				respond_to do |format|
				format.js
				end
			else
				nil
			end

	end

	def edit
		@tasks = current_user.tasks
		@task = current_user.tasks.find(params[:id])
		respond_with @task
	end

	def update
		@tasks = current_user.tasks
		@task = current_user.tasks.find(params[:id])
		if @task.update_attributes(params[:task])
			flash[:notice] = "Task was updated!"
			respond_with @task 
		else
			nil
		end
	end

	def destroy
		@tasks = current_user.tasks
		@task = current_user.tasks.find(params[:id])
		@task.destroy
		flash[:notice] = "Successfully destroyed post."
		respond_to do |format|
			format.js
		end
	end

end
