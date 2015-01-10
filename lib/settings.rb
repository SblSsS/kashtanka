module Settings

	class << self
		attr_accessor :configuration
	end

	def self.configure
		return if !Setting.table_exists?

		self.configuration ||= Core::Config.new(true)
		yield(self.configuration.setting_hash)
		self.configuration.save_hash
	end

	def self.config
		self.configuration ||= Core::Config.new
		self.configuration.setting_hash
	end

	def self.refresh
		self.configuration ||= Core::Config.new
		self.configuration.refresh_hash
	end
end