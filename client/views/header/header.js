Template.header.rendered = function () {
  $('.ui.sidebar')
      .sidebar({
        overlay: true,
        duration: '2000'
      })
      .sidebar('attach events', '#close', 'hide')
      .sidebar('attach events','#btn', 'toggle')
  ;

  $('.ui.dropdown').dropdown();
};

// Template.header.events({
//   'click #btn': function () {
//     $('.ui.sidebar').sidebar('toggle');
//   },
//   'click .vertical.menu .header': function(e) {
//     e.preventDefault();
//     $('.ui.sidebar').sidebar('toggle');
//   }
// });