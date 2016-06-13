module ApplicationHelper

  def currency(number)
    number_to_currency(number)
  end

  def format_date(date)
    date.to_formatted_s(:long)
  end

end
