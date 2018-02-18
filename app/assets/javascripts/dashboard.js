(function(QS, QSA){
  document.addEventListener('turbolinks:load', function(event) {
    if (document.querySelector('.dashboard.index')) {
      checkGithubForHomework();
    }
  });

  function checkGithubForHomework() {
    QS('.github-status').textContent = 'Checking Github...'
    searchGithub()
    setInterval(searchGithub, 15*1000);

    function searchGithub() {
      var getPRs = fetch('https://api.github.com/repos/kasun-maldeni/WDI_14_HOMEWORK/pulls').then(function(response) {
        return response.json();
      }).then(function(pullRequests) {
        var ghUsername = QS('[data-gh-username]').dataset.ghUsername;
        return pullRequests.some(function(req) {
          return req.user.login === ghUsername;
        })
      }).then(function(prFound) {
        var message = prFound ? 'Homework submitted' : 'Waiting for submission';
        QS('.github-status').textContent = message;
      }).catch(function() {
        QS('.github-status').textContent = 'Failed to connect to Github';
      });
    }
  }
})(document.querySelector.bind(document), document.querySelectorAll.bind(document))
