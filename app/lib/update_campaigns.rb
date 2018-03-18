class UpdateCampaigns
  class << self
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

    def run
      objects = JSON.parse(File.open("./app/lib/0.txt", "rb").read)["response"]
      # response = Net::HTTP.get(URI("https://api.indiegogo.com/2/campaigns.json?id=#{TEAM_IDS}"))
      objects.each do |object|
        id = object["id"].to_i
        campaign = Campaign.find_by(igg_id: id)
        raised = object["collected_funds"]
        goal = object["goal"]
        percent_raised = calculate_percent_raised(goal.to_f, raised.to_f)
        if campaign
          campaign.update!(
            title: object["title"],
            slug: object["slug"],
            goal: goal,
            raised: raised,
            image_url: object["image_types"]["baseball_card"],
            percent_raised: StringFormatter.format_percent(percent_raised),
            percent_togo: StringFormatter.format_percent(calculate_percent_togo(percent_raised))
          )
        else
          Campaign.create!(
            goal: goal,
            raised: raised,
            igg_id: id,
            title: object["title"],
            slug: object["slug"],
            image_url: object["image_types"]["baseball_card"],
            percent_raised: StringFormatter.format_percent(percent_raised),
            percent_togo: StringFormatter.format_percent(calculate_percent_togo(percent_raised))
          )
        end
      end
    end

    private

    def calculate_percent_raised(goal, raised)
      return 100.0 if raised >= goal
      (raised / goal) * 100.0
    end

    def calculate_percent_togo(percent_raised)
      100.0 - percent_raised
    end
  end
end
