class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    @all_goal = Campaign.sum(:goal)
    @all_raised = Campaign.sum(:raised)
    @raised_bar = @all_raised > @all_goal ? @all_goal : @all_raised
  end
end
