window.addEventListener("DOMContentLoaded", initToggleSpans, false);

function initToggleSpans() {
  let toggleSpans = document.querySelectorAll("span.toggle-span");
 
  toggleSpans.forEach(function (span) {
    span.addEventListener("click", toggleClick);
  });
}
 
function toggleClick(event) {
  let span = event.currentTarget;
  toggleOnClass(span);
}
 
function toggleOnClass(element) {
  element.classList.toggle("on");
}
 