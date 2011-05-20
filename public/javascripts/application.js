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
      $('#wrapper').load('projects/change', {
        drag_id: $(props.draggable).attr('id'),
        drop_id: $(this).attr("id")
      });
    }
  });
});