(function(QS, QSA){
  document.addEventListener('turbolinks:load', function(event) {
    if (QS('.dashboard.index')) {
      checkGithubForHomework();
    }
  });

  function checkGithubForHomework() {
    var gs = QS('.github-status > .message');
    var mi = QS('.github-status > .material-icons');
    gs.textContent = 'Checking Github...';
    setTimeout(searchGithub, 3000);

    function searchGithub() {
      var getPRs = fetch('https://api.github.com/repos/kasun-maldeni/WDI_15_HOMEWORK/pulls').then(function(response) {
        return response.json();
      }).then(function(pullRequests) {
        var ghUsername = QS('[data-gh-username]').dataset.ghUsername;
        return pullRequests.some(function(req) {
          return req.user.login === ghUsername;
        })
      }).then(function(prFound) {
        gs.remove();
        if (prFound) {
          mi.textContent = 'check_circle';
          mi.classList.add('success');
        } else {
          mi.textContent = 'cancel';
          mi.classList.add('error');
        }
      }).catch(function() {
        gs.textContent = 'Failed to connect to Github';
      });
    }
  }
})(document.querySelector.bind(document), document.querySelectorAll.bind(document))
