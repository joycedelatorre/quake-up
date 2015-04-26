$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var lat = $("#latitude").val();
  var lon = $("#longitude").val();
  var mag = $("#magnitude").val();
  var radius = $("#radius").val();

  $.get('/rest/v1/earthquakes?&lat='+lat+'&lon='+lon+'&mag='+mag+'&radius='+radius,function(data){
    quakes = data.features
      for(i=0; i<quakes.length; i++){
        var properties = quakes[i].properties

        dateAndTime = new Date(properties.time);

        var tsunami = false;
        if (properties.tsunami === 1){
          tsunami = true;
        }

        $('#table').append(
          "<tr>"+
            "<td>"+properties.place+"</td>"+
            "<td>"+dateAndTime+"</td>"+
            "<td>"+properties.mag+"</td>"+
            "<td>"+tsunami+"</td>"+
          "</tr>"
           );
      }
    },"json");

});



