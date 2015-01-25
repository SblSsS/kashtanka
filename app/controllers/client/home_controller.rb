class Client::HomeController < ClientController
	skip_before_action :enabled?, only: [:disabled]
	layout 'under_dev', only: [:disabled]

  def index
  end

  def language
  	I18n.locale 		 = params[:iso]
  	cookies[:locale] = {:value => params[:iso], :expires => 2.weeks.from_now.utc}

  	redirect_to :back
  end

  def disabled
  	@title = t(:under_dev)
  end
end
