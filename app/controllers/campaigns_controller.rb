class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    @all_goal = Campaign.sum(:goal)
    @all_raised = Campaign.sum(:raised)
    @raised_bar = @all_raised > @all_goal ? @all_goal : @all_raised
    @raised_percentage = (@raised_bar / @all_goal) * 100
    @togo_percentage = 100 - @raised_percentage
    # @raised_percentage = 10
    # @togo_percentage = 100 - @raised_percentage
    if @raised_percentage >= 100
      @raised_extra_styles="border-radius:20px"
      @togo_extra_styles=""
    elsif @togo_percentage >= 100
      @togo_extra_styles="border-radius:20px"
      @raised_extra_styles=""
    else
      @raised_extra_styles=""
      @togo_extra_styles=""
    end
    @raised_percentage = "#{@raised_percentage}%"
    @togo_percentage = "#{@togo_percentage}%"
    @all_goal = "$%.2f" % @all_goal
    @all_raised = "$%.2f" % @all_raised
  end
end
