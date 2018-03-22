class UpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Campaign.delete_all
    UpdateCampaigns.run
    CreateProjectSnapshot.run
  end
end
