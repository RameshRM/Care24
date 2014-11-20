# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

    # enable only for patient page
    #================================
    
    #intervalID = setInterval ()->
    #    check_msg()
    #, 10000

    $(".measures_item").click ->
        alert $(this).data("id")

window.caretrack=[]
window.caretrack.check_msg = ()->
    #alert("checking msg")
    email = $("#patient_email").data("patient-email")
    base_url = (window.location.href)
    location = '/get_msg?to=caregiver@test.com&from=' + email
    if (base_url[base_url.length-1] == '/')
        base_url = base_url.substring(0,base_url.length-1)
    
    location = base_url + location
    $.getJSON(
        location, 
        (data)->
            #alert "success"
            console.log data
            if data != null
                #alert "New Message"
                window.location.reload()

    )
