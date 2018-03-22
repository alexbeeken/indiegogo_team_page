require 'open-uri'
require 'net/http'
require 'net/https'

class UpdateCampaigns
  class << self
    def run
      objects = get_campaigns
      objects.each do |object|
        id = object["id"]
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

    def get_campaigns
      ids_params = (ENV['TEAM_IDS'].split(',').map { |s| "ids[]=#{s}&" }).join
      uri = URI("https://api.indiegogo.com/2/campaigns.json?#{ids_params}api_token=#{ENV['API_TOKEN']}")
      res = Net::HTTP.get(uri)

      JSON.parse(res)['response']
    end
  end
end
