class DashboardsController < ApplicationController
  def homepage
    render({ :template => "html_templates/homepage.html.erb" })
  end

  def currency_list
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @symbols = parsed_data.fetch("symbols").keys
    render({ :template => "html_templates/currency_list.html.erb" })
  end

  def currency_convert
    @currency_one = params.fetch(:currency_one)
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @symbols = parsed_data.fetch("symbols").keys
    # @currency_two = params.fetch(:currency_two)
    # url = "https://api.exchangerate.host/convert?from=" + @currency_one + "&to=" + @currency_two
    render({ :template => "html_templates/currency_convert.html.erb" })
  end

  def conversion
    @currency_one = params.fetch(:currency_one)
    @currency_two = params.fetch(:currency_two)
    url = "https://api.exchangerate.host/convert?from=" + @currency_one + "&to=" + @currency_two
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @rate = parsed_data.fetch("result")
    p "the rate is"
    p @rate
    p "that it is"
    render({ :template => "html_templates/conversion.html.erb" })
  end
end
