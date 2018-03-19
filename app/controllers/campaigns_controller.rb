class CampaignsController < ApplicationController
  def index
    @snapshot = ProjectSnapshot.latest
  end

  def sunrise
    @snapshot = ProjectSnapshot.latest
  end
end
