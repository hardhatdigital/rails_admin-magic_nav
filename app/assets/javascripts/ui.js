//MAGIC NAV ENGINE

var magicNav = {
  active: true,  //KILL SWITCH FOR MAGIC NAV IN DEVELOPMENT
}

if (magicNav.active) {
  $(document).on('rails_admin.dom_ready', function( ) {

    if ($("#new-nav").length) {
      return;
    }
    var $sidebar = $(".sidebar-nav").hide().wrapInner("<div id='old-nav' />");

    $sidebar.before("<img class='nav-loading' src='/admin-assets/loading.gif' alt='loading' />");

    //load in new siteMap
    $.get("/magic_nav", function(data, stat){
      $(".nav-loading").fadeOut(function(){
        $(this).remove();

        // adapt classes on main rails admin body section to resize for new custom nav
        // required as rails admin ui has changed in new version of gem 0.6.8, implemented for ruby 2.0.0
        $(".container-fluid .row > div:last-child").removeClass("col-md-10 col-md-offset-2").addClass("col-md-9 col-md-offset-3");

        $sidebar.before(data);
        $("#new-nav").fadeIn();
        magicNav.addEventListeners();
      });
    });
  });
}

magicNav.addEventListeners = function(){
  //WARNING: SERIOUS HACKS IN HERE
  $("a[data-model='intro_block']").on("click", function(){
    setTimeout(function(){
      $("a:contains('Add filter')").closest("li").hide();
    }, 200);
  });


}

