document.addEventListener('turbolinks:load', function(event) {
  document.querySelectorAll('[data-datetime]').forEach(function(element) {
    element.textContent = moment(element.dataset.datetime).fromNow();
  })
})
