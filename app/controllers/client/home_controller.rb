class Client::HomeController < ClientController
  def index
  end

  def language
  	I18n.locale 		 = params[:iso]
  	cookies[:locale] = {:value => params[:iso], :expires => 2.weeks.from_now.utc}

  	redirect_to :back
  end
end
