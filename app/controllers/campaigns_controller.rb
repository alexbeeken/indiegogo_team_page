class CampaignsController < ApplicationController
  def index
    @snapshot = ProjectSnapshot.latest
  end
end
