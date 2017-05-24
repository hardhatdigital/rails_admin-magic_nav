class RailsAdminMagicNavGenerator < Rails::Generators::Base

  source_root File.expand_path("../../../", __FILE__)

  def create_magic_nav_yml
    copy_file("config/magic_nav.yml", "config/rails_admin/magic_nav.yml")
  end

  def create_javascripts
    copy_file("app/assets/javascripts/ui.js", "app/assets/javascripts/rails_admin/custom/ui.js")
  end

  def create_stylesheets
    copy_file("app/assets/stylesheets/mixins.scss", "app/assets/stylesheets/rails_admin/custom/mixins.scss")
  end
  
  def create_helpers
    copy_file("app/helpers/magic_nav_helper.rb", "app/helpers/rails_admin/magic_nav_helper.rb")
  end  

  def create_controllers
    copy_file("app/controllers/magic_nav_controller.rb", "app/controllers/rails_admin/magic_nav_controller.rb")
  end  

end
