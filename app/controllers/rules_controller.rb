class RulesController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :update, :destroy]

  def index
    @rules = Rule.all
  end

  def show
  end

  def new
    @rule = Rule.new
  end

  def edit
  end

  def create
    @rule = Rule.new(rule_params)
    if @rule.save
      @rules = Rule.all
    else
      render json: {
        error: @rule.error.full_messages
      }, status: 422
    end
  end

  def update
    if @rule.update(rule_params)
    else
      render json: {
        error: @rule.error.full_messages
      }, status: 422
    end
  end

  def destroy
    @rule.destroy
  end

  private
  def set_rule
    @rule = Rule.find(params[:id])
  end

  def rule_params
    params.require(:rule).permit(:name, :description)
  end
end
