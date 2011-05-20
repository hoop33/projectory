$('document').ready(function() {
  if ($('#colorpicker').length) {
    $('#colorpicker').farbtastic('#project_color');
  }

  $('.title').draggable( {
    containment: "#wrapper"
  });

  $('.week').droppable( {
    accept: '.title',
    hoverClass: 'active',
    drop: function(event, props) {
      $('#wrapper').load('/projects/change', {
        project_id: $(props.draggable).attr('id'),
        week_id: $(this).attr('id'),
        redirect_path: window.location.pathname,
        requested_action: 'add'
      });
    }
  });

  $('.project').hover(function() {
    $(this).addClass('delete');
  }, function() {
    $(this).removeClass('delete');
  });

  $('.project').click(function(event, props) {
    $('#wrapper').load('/projects/change', {
      project_id: $(this).attr('id'),
      week_id: $(this).attr('week_id'),
      redirect_path: window.location.pathname,
      requested_action: 'delete'
    });
  });

});