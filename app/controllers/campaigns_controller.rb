class CampaignsController < ApplicationController
  def funds
    @snapshot = ProjectSnapshot.latest
  end
end
