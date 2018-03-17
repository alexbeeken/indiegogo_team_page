class ProjectSnapshot < ApplicationRecord
  def no_donations?
    togo_percentage == "100%"
  end

  def goal_met?
    percent_raised == "100%"
  end

  def self.latest
    order("created_at").last
  end
end
