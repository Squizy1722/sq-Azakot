$(document).ready(function() {

let display = false
    
  window.addEventListener("message", function(event) {
      const item = event.data;
      if(item.type == 'show') {
        if(item.Alerts) {
          $('.AlertsContainer').empty();
          let Alerts = item.Alerts.sort((a, b) => {
            return a.area.localeCompare(b.area, 'he')
          })
          for (var i = 0; i < Alerts.length; i++) {
            let alert = Alerts[i]
            NewRow = `
            <div class="alert">
                <div class="name">${alert.area}</div>
            </div>
            `
            $('.AlertsContainer').append(NewRow)
  }
        }
        Display(item.status)
      }
    });

    function Display(bool) {
      display = bool

      if(bool) {
        $('.MainContainer').slideDown()
      } else {
        $('.MainContainer').slideUp()
      }
    }
  });

            document.onkeyup = function (data) {
        if (data.which == 27) {
          $.post("https://sq-Azakot/hide", JSON.stringify({}));
        }};