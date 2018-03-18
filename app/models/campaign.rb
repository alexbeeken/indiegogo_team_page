class Campaign < ApplicationRecord
  def display_raised
    format_money(raised)
  end

  def integer_percent_raised
    percent_raised.to_i.round
  end

  def integer_percent_togo
    (100 - integer_percent_raised)
  end

  private

  def format_money(number)
    StringFormatter.format_money(number)
  end
end
