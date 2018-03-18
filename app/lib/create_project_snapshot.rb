class CreateProjectSnapshot
  class << self
    def run
      ProjectSnapshot.create!(
        raised: StringFormatter.format_money(all_raised),
        goal: StringFormatter.format_money(all_goals),
        percent_raised: StringFormatter.format_percent(percent_raised),
        percent_togo: StringFormatter.format_percent(percent_togo)
      )
    end

    private

    def all_goals
      Campaign.sum(:goal)
    end

    def all_raised
      Campaign.sum(:raised)
    end

    def percent_raised
      return 100 if all_raised >= all_goals
      (all_raised / all_goals) * 100
    end

    def percent_togo
      100 - percent_raised
    end
  end
end
