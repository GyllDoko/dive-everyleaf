class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  

  # GET /tasks or /tasks.json
  def index

    @tasks = current_user.tasks.all.page(params[:page]).per(5)
    @tasks = current_user.tasks.all.order_by_deadline.page(params[:page]).per(5) if params[:sort_expired] == "true"
    @tasks = current_user.tasks.all.order_by_priority_button.page(params[:page]).per(5) if params[:sort_by_priority] == "true"




    @tasks = Task.all.order("created_at desc")

  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new  
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    @task.status=params[:task][:status]  
    @task.priority=params[:task][:priority]
   
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def search 
    session[:search] = {'name' => params[:search_title], 'status' => params[:search_status], 'priority' => params[:search_priority]}
   
    if params[:search_title].present?
      if params[:search_status].present?
        if params[:search_priority].present?
          @tasks = current_user.tasks.title_search(params[:search_title]).order_by_status(params[:search_status]).order_by_priority(params[:search_priority]).kaminari params[:page] 
        else
          @tasks = current_user.tasks.title_search(params[:search_title]).order_by_status(params[:search_status]).kaminari params[:page] 
        end
      elsif params[:search_priority].present?
        @tasks = current_user.tasks.title_search(params[:search_title]).order_by_priority(params[:search_priority]).kaminari params[:page] 
      else
        @tasks = current_user.tasks.title_search(params[:search_title]).kaminari params[:page] 

      end
    elsif params[:search_status].present?
      
      if params[:search_priority].present?
        @tasks = current_user.tasks.order_by_status(params[:search_status]).order_by_priority(params[:search_priority]).kaminari params[:page] 
      else
        @tasks = current_user.tasks.order_by_status(params[:search_status]).kaminari params[:page] 
      end
    elsif params[:search_priority].present?
      
      if params[:search_status].present?
        @tasks = current_user.tasks.order_by_priority(params[:search_priority]).order_by_status(params[:search_status]).kaminari params[:page] 
      else
        @tasks = current_user.tasks.order_by_priority(params[:search_priority]).kaminari params[:page] 
      end
    else
      @tasks = current_user.tasks
    end
  
    # @labels = Label.where(user_id: nil).or(Label.where(user_id: current_user.id))
    
    render :index
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :content, :status, :priority, :expiry_date)
    end
end
