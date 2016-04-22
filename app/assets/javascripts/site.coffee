# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('section#search input').on('keyup', (e) ->
    $.getJSON 'http://andrewshistory.herokuapp.com/students', {
      pupilForname: $('input[name=pupilForname]').val()
      pupilSurname: $('input[name=pupilSurname]').val()
      address: $('input[name=address]').val()
      age: $('input[name=age]').val()
      registerNumber: $('input[name=registerNumber]').val()
    }, (data) ->
      table = $('<table id="dataTable" class="table table-responsive"> </table>')
      table.append '<tr> <th> First Name </th> <th> Second Name </th> <th> Address </th> <th> Religion </th> <th> Age </th> <th> Register Number </th> <th> Additional Notes </th> <th> Date of Entry </th> <th> Parent\'s Occupation </th></tr>'
      items = []
      $.each data, (key, student) ->
        dataString = '<tr><td>' + student['pupilForname'] +
                     '</td><td> '+student['pupilSurname'] +
                     '</td><td><a href="http://maps.google.com/?q=' + student['pupilAddress'] + ',Ireland" target="_blank"> ' + student['pupilAddress'] + '</a>' +
                     '</td><td>' + student['pupilReligion'] +
                     '</td><td> ' + student['age'] +
                     '</td><td>' + student['registerNumber'] +
                     '</td><td>' + student['additionalNotes'] +
                     '</td><td>' + student['dateOfEntry'] +
                     '</td><td>' + student['parentsOccupation'] + "</td></tr>"

        table.append dataString.replace /null/g, "N/A"
        return
      $('#dataTable').replaceWith table
      return
    e.preventDefault()
    return
    )
  return

# ---
# generated by js2coffee 2.1.0
