$ ->
	
	$(document).ready ->

  	$('.chosen-select.roles').chosen
    	allow_single_deselect: true
    	display_selected_options: false
    	no_results_text: 'No results matched'

  	$('.chosen-select.tags').chosen
      create_option: true
      persistent_create_option: true
      skip_no_results: true
    	allow_single_deselect: true
    	display_selected_options: false
    	no_results_text: 'No results matched'