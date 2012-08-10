class TasksController < ApplicationController

	before_filter :authenticate_user!
	respond_to :html, :xml, :json

	def index
		@tasks = current_user.tasks
		@dotasks = current_user.tasks.where(:completed => false)
		@task = Task.new
		@completed = current_user.tasks.where(:completed => true)
		respond_with @tasks, @task, @completed
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
		@dotasks = current_user.tasks
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
		@completed = current_user.tasks.where(:completed => true)
		@task.destroy
		flash[:notice] = "Successfully destroyed post."
		respond_to do |format|
			format.js
		end
	end

end
