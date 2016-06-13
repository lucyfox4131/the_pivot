module ApplicationHelper

  def present(object, klass = nil)
    klass ||="#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def currency(number)
    number_to_currency(number)
  end

  def format_date(date)
    date.to_formatted_s(:long)
  end

end
