$(function(){
  function buildHTML(comment){
    let html = `<div class = "list">
                  <div class = "list__name">
                    <a href= /users/${comment.user_id}>${comment.user_name}:</a>
                  </div>
                  <div class= "list__text">
                    ${comment.text}
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $(".lists").append(html);
      $(".textbox").val("");
      $(".form__submit").prop("disabled", false);
    })
    .fail(function(){
      alert("error");
    })
  })
});