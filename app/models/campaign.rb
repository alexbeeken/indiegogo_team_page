class Campaign < ApplicationRecord
  def display_raised
    format_money(raised)
  end

  private

  def format_money(number)
    fnum = format('%.2f',number)
      .gsub('.00','')
      .reverse
      .scan(/(\d*\.\d{1,3}|\d{1,3})/)
      .join(',')
      .reverse
    "$#{fnum}"
  end
end
