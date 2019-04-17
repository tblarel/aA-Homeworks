console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
    method:"GET",
    url:"http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
    dataType: "JSON",
    success: function(message) {
        console.log(message);
        console.log(`This current weather in ${message.name} is ${message.weather[0].description}`);
    }
})

console.log("Done with request");