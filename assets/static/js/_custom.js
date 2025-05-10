

/** google_map js **/
function myMap() {
    var mapProp = {
        center: new google.maps.LatLng(-18.871651, 47.509403),
        zoom: 18,
    };
    var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
}

