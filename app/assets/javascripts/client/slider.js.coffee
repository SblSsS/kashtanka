$ ->
    $(document).ready ->

        $('#slider .image-box').cycle
            fx: 'scrollHorz',
            next: '#arrow-right',
            prev: '#arrow-left',
            rev: true,
            timeout: 5000,
            startingSlide: 0
            after: ->
               num = $( '.image-box img:visible').data( 'number' )
               changeSwitch( num ) 

        $('.switcher a[data-slide]').click ->
            goToSlide( $(this).data('slide') )

changeSwitch = ( num ) ->
    switchers = $( '.go-to' )

    switchers.each ->
        $(this).removeClass('active')
        if $(this).data( 'slide' ) == num
            $(this).addClass('active')
        
goToSlide = ( slide ) ->
    $( '#slider .image-box' ).cycle( slide )
    changeSwitch( slide )
    return false

