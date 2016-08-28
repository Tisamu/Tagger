# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Script Used for the Infinite-Scroll
$ ->
  $('#post_message').keyup ->
    $('#post-length').html($('#post_message').val().length + '/140 Max. characters') 
  #If there is an infinite scroll available on the page..
  # (It means that more content that can be displayed on a single page is available)
  if $('#infinite-scrolling').length > 0
    # If we scroll
    $(window).on 'scroll', ->
      # The next page content url is prepared
      more_posts_url = $('.pagination a[rel=next]').attr('href')
      # If the scroll is down enough..
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
          # We hide the pagination part.
          $('.pagination').html("")
          # And we call the page content ajax function (which load a partial view)
          $.ajax
            url: more_posts_url
            success: (data) ->
              # Then we add the loaded content to the list
              $("#post-list").append(data)
      # If there is no more content to load, then we just hide the pagination part.
      if !more_posts_url
        $('.pagination').html("")
    return

  