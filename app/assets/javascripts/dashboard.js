document.addEventListener('turbolinks:load', function(event) {
  var ghUsername = document.querySelector('[data-gh-username]').dataset.ghUsername
  var githubPRInfo = function(message) {
    console.log(message);
  };
  githubPRInfo('Checking Github...')
  var getPRs = fetch('https://api.github.com/repos/kasun-maldeni/WDI_14_HOMEWORK/pulls').then(function(response) {
    return response.json();
  }).then(function(pullRequests) {
    return pullRequests.some(function(req) {
      return req.user.login === ghUsername;
    })
  }).then(function(prFound) {
    var message = prFound ? 'Homework submitted' : 'Waiting for submission';
    githubPRInfo(message);
  }).catch(function() {
    var message = 'Failed to connect to Github';
    githubPRInfo(message);
  });
});
