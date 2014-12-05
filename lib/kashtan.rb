module Kashtan
	extend self

	def configure
		@@config ||= Core::Config.new
		yield(@@config.setting_hash)
	end

	def config
		@@config.setting_hash
	end
end