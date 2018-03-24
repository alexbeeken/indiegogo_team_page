class CampaignsController < ApplicationController
  def funds
    @snapshot = ProjectSnapshot.latest
  end

  def sunrise
    @snapshot = ProjectSnapshot.latest
  end
end
