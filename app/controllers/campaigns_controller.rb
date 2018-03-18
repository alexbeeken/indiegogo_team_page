class CampaignsController < ApplicationController
  def index
    @snapshot = ProjectSnapshot.latest
    calculate_extra_styles
  end

  private

  def calculate_extra_styles
    if @snapshot.goal_met?
      @raised_extra_styles="border-radius:60px"
      @togo_extra_styles=""
    elsif @snapshot.no_donations?
      @togo_extra_styles="border-radius:60px"
      @raised_extra_styles=""
    else
      @raised_extra_styles=""
      @togo_extra_styles=""
    end
  end
end
