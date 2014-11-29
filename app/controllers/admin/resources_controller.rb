class Admin::ResourcesController < AdminController
	before_action :load_resource

	respond_to :html

	def index
	end

	def new
	end

	def publish
	end

	def change_position
	end

	def create
		@resource.attributes = resource_params
		if @resource.save
			flash[:notice] = t(:create_message, resource: model_name, scope: :flash)
			respond_with(@resource) do |format|
				format.html { redirect_to action: :index }
			end			
		else
			respond_with(@resource) do |format|
				format.html do 
					flash[:error] = @resource.errors.full_messages.join(", ")
					render action: :new
				end
			end
		end
	end

	def update
		if @resource.update_attributes(resource_params)
			flash[:notice] = t(:update_message, resource: model_name, scope: :flash)
			respond_with(@resource) do |format|
				format.html { redirect_to action: :index }
			end
		else
			respond_with(@resource) do |format|
				format.html do 
					flash[:error] = @resource.errors.full_messages.join(", ")
					render action: :edit
				end
			end
		end
	end

	def destroy
		if instance_variable_defined? "@#{resource_name}"
			instance_variable_get("@#{resource_name}").destroy
			flash[:notice] = t(:destroy_message, resource: model_name, scope: :flash)
		end 
		redirect_to action: :index
	end

	protected

	def model_name
		"#{controller_name}".singularize.capitalize
	end

	def resource_name
		"#{controller_name}".singularize
	end

	def model
		model_name.constantize
	end

	def action
		params[:action].to_sym
	end

	def load_resource
		if params[:id] || [:new, :create].include?(action)
			@resource ||= load_entity
			authorize! action, @resource

			instance_variable_set( "@#{resource_name}", @resource )
		else
			@collection ||= load_collection
			#Think how to authorize collection

			instance_variable_set( "@#{controller_name}", @collection )
		end

		@active_tab = controller_name
	end

	def load_entity
		if params[:id]
			model.find(params[:id])
		elsif [:new, :create].include?(action)
			model.new()
		end
	end

	def load_collection
		model.all
	end

	def resource_params
		params[resource_name].present? ? params.require(resource_name).permit! : ActionController::Parameters.new
	end
end