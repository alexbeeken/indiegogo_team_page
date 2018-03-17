class UpdateCampaignsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UpdateCampaigns.scrape
  end
end
