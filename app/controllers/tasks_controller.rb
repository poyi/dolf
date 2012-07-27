class TasksController < ApplicationController

	before_filter :authenticate_user!
	respond_to :html, :xml, :json

	def index
		@tasks = current_user.tasks
		@task = current_user.tasks.build(params)
		respond_with @tasks
	end

	def new
		@task = current_user.tasks.build(params)
		respond_with @task
	end

	def create 
		@task = current_user.tasks.build(params[:task])

		respond_with(@task) do |format|
			if @task.save
				flash[:notice] = "Task was created successfully!"
				format.html { redirect_to tasks_url }
				format.xml { render :xml => @task }
				format.json { render :json => @task}
				format.js
			else
				format.html { render :action => :new }
				format.js
			end
		end

	end

	def edit
		@task = current_user.tasks.find(params[:id])
		respond_with @task
	end

	def update
		@task = current_user.tasks.find(params[:id])
		if @task.update_attributes(params[:task])
			flash[:notice] = "Task was updated!"
			respond_with(@task, :location => tasks_url)
		else
			nil
		end
	end

	def destroy
		@task = current_user.tasks.find(params[:id])
		@task.destroy

		respond_with @task
		format.js   { render :nothing => true }
	end

end
