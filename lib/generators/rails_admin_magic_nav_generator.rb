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
  

end
