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

  def currency_short(number)
    number_to_currency(number, precision: 0)
  end

  def format_date(date)
    date.to_formatted_s(:long)
  end

  def days_from_today (date)
    distance_of_time_in_words(Date.today, date)
  end

  def parsed_tweet(tweet)
    parsed_tweet = tweet.text.dup
    tweet.urls.each do |entity|
      html_link = link_to(entity.display_url.to_s, entity.expanded_url.to_s)
      parsed_tweet.sub!(entity.url.to_s, html_link)
    end
    parsed_tweet.html_safe
  end

  def charity_exists(admin)
    if admin.charities.first
      admin.charities.first.name
    end
  end

end
