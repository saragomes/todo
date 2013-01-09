class TasksController < ApplicationController
  respond_to :html, :json
  before_filter :require_user
  helper_method :sort_column, :sort_direction
  autocomplete :category, :name
  
  def index
    search
    @tasks = @tasks.paginate(:per_page => 5, :page => params[:page])
    @categories = @current_user.categories.map(&:name).compact.reject(&:blank?)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @tasks }
    end
  end

  def create
    @task = Task.new(params[:task])
    @task.user = @current_user
    @task.done = false
    @category = Category.find_or_create_by_name_and_user_id params[:task][:category_id], @current_user.id
    @task.category = @category
    respond_to do |format|
      if @task.save
        @tasks = @current_user.tasks.paginate(:per_page => 5, :page => params[:page]) 
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.js { render }
      else
        format.html { render action: "new" }
        format.js { render }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with @task
  end

  def destroy
    @task = @current_user.tasks.find(params[:id])
    @task.destroy
    @tasks = @current_user.tasks.paginate(:per_page => 5, :page => params[:page])
    @task.destroy_category?
    
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task destroyed!' }
      format.js { render :index }
    end
  end
  
  def destroy_multiple
    
  
    @tasks = Task.find [49, 50]
    
    puts "destroy_multipleeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
    pp @tasks
    
    @tasks.each do |task|
      #task.destroy
    end
    flash[:notice] = "Destroyed tasks!"
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js { render :index }
    end
  end
  
  def filter_by_category
    @tasks = @current_user.tasks.paginate(:per_page => 5, :page => params[:page])
    @tasks = @tasks.all :conditions => ["category_id = ?", params[:category]] unless params[:category].eql?""
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js { render :index }
    end
  end
  
  def done
    @task = @current_user.tasks.find(params[:id])
    @task.update_attribute(:done, true)
    @task.update_attribute(:done, true)
    @tasks = @current_user.tasks.paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js { render :index }
    end
  end
  
private
  def search
    @tasks = @current_user.tasks
    @tasks = @tasks.order("#{params[:sort]} #{params[:direction]}")
    @tasks = @tasks.joins(:category).where("tasks.name like ? OR categories.name like ? 
             ", "%#{params[:search]}%", "%#{params[:search]}%") unless params[:search].blank? 
  end
  
  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
