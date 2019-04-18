document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };


  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const catFormEl = document.getElementById("place-form");
    
  catFormEl.addEventListener("submit", event => {
    // **cancel** the event; if the event were not canceled the browser
    // would try to submit the form for real.
    event.preventDefault();

    // Get the name input element (type `HTMLInputElement`), get the
    // value, and clear it.
    const placeNameInputEl = document.getElementById("place-name")
    const placeName = placeNameInputEl.value;
    placeNameInputEl.value = "";

    // Get the ul of places.
    const ul = document.getElementById("sf-places");
    // create an li element
    const li = document.createElement("li");
    // set the text of the li to be the value of the input field
    li.textContent = placeName;

    // insert it as the last item in the ul.
    ul.appendChild(li);
  });


  const showButton = document.getElementsByClassName("photo-show-button")[0];
  showButton.addEventListener("click", event => {
    event.preventDefault();
    const photoForm = document.getElementsByClassName("photo-form-container")[0];
    if (photoForm.className == "photo-form-container hidden" ) {
      photoForm.className = ("photo-form-container");
    } else {
      photoForm.className = ("photo-form-container hidden");
    }
  });


  const photoForm = document.getElementsByClassName("photo-form-container")[0];
  photoForm.addEventListener("submit", event => { 
    event.preventDefault();
   
    const photoUrlInputEl = document.getElementsByClassName("photo-url-input")
    const photoUrl = photoUrlInputEl.value;
    photoUrlInputEl.value = "";
    
    var newImage = document.createElement('img');
    newImage.setAttribute ('src',photoUrl);
    newImage.setAttribute('alt', 'error');

    const ul = document.getElementsByClassName("dog-photos")[0];
    const li = document.createElement("li");
    li.appendChild(newImage);
    ul.appendChild(li);

  });



  // adding new photos

  // --- your code here!



});
