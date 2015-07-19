module Core
	include Settings # Including setting handler methods

	# Set preferences section
	set_pref :version, default: "1.0.0"
	set_pref :multilanguage, db: true, default: false, parser: "BooleanParser"
	set_pref :enabled, db: true, default: true, parser: "BooleanParser"
	set_pref :title, db: true, default: "Kashtanka"
	set_pref :keywords, db: true, parser: "TextParser"
	set_pref :description, db: true, parser: "TextParser"

	# Configure block
	def self.configure
		yield self if block_given?
	end

end