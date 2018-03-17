class UpdateCampaigns
  TEAM_IDS = [
    1057016,
    1034275,
    1034336,
    991441,
    875862,
    1003754,
    827734,
    1051999,
    942524
  ]

  def self.run
    objects = JSON.parse(File.open("./app/lib/0.txt", "rb").read)["response"]
    # response = Net::HTTP.get(URI("https://api.indiegogo.com/2/campaigns.json?id=#{TEAM_IDS}"))
    objects.each do |object|
      id = object["id"].to_i
      campaign = Campaign.find_by(igg_id: id)
      if campaign
        campaign.update!(
          title: object["title"],
          slug: object["slug"],
          goal: object["goal"],
          raised: object["collected_funds"],
          image_url: object["image_types"]["baseball_card"]
        )
      else
        Campaign.create!(
          igg_id: id,
          title: object["title"],
          slug: object["slug"],
          goal: object["goal"],
          raised: object["collected_funds"],
          image_url: object["image_types"]["baseball_card"]
        )
      end
    end
  end
end
