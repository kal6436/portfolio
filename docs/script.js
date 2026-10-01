window.addEventListener("DOMContentLoaded",init, false);

function init() {
  let popup = document.getElementById("myPopup");
  let openButton = document.getElementById("openPopup");
  let closeButton = document.getElementById("closePopup");

  openButton.addEventListener("click", function () {
  popup.style.display = "block";
});

closeButton.addEventListener("click", function () {
  popup.style.display = "none";
});
}

