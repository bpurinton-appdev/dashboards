Rails.application.routes.draw do
  get("/", { :controller => "dashboards", :action => "homepage" })
  get("/forex", { :controller => "dashboards", :action => "currency_list" })
  get("/forex/:currency_one", { :controller => "dashboards", :action => "currency_convert" })
  get("/forex/:currency_one/:currency_two", { :controller => "dashboards", :action => "conversion" })
end
