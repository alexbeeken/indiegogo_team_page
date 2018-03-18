class StringFormatter
  class << self
    def format_money(number)
      fnum = format('%.2f', number)
        .gsub('.00','')
        .reverse
        .scan(/(\d*\.\d{1,3}|\d{1,3})/)
        .join(',')
        .reverse
      "$#{fnum}"
    end

    def format_percent(number)
      "#{number}%"
    end
  end
end
