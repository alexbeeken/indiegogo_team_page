class UpdateCampaignsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UpdateCampaigns.run
  end
end
