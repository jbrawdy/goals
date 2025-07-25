class GoalsController < ApplicationController 
  before_action :set_goal, only: %i[ show edit update destroy ]

  # GET /goals or /goals.json
  def index
    @goals = Current.user.goals
  end

  # GET /goals/1 or /goals/1.json
  def show
    @goal = Current.user.goals.find(params[:id])
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
    @goal = Current.user.goals.find(params[:id])
  end

  # POST /goals or /goals.json
  def create
    # @goal = Goal.new(goal_params)

    @goal = Current.user.goals.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: "Goal was successfully created." }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1 or /goals/1.json
  def update

    @goal = Current.user.goals.find(params[:id])

    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: "Goal was successfully updated." }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1 or /goals/1.json
  def destroy
    @goal = Current.user.goals.find(params[:id])

    @goal.destroy!

    respond_to do |format|
      format.html { redirect_to goals_path, status: :see_other, notice: "Goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.expect(goal: [ :goal, :details, :date, :accomplished ])
    end


end
