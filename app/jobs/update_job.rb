class UpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UpdateCampaigns.run
    CreateProjectSnapshot.run
  end
end
