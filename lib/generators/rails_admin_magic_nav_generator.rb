class RailsAdminMagicNavGenerator < Rails::Generators::Base

  source_root File.expand_path("../../../", __FILE__)

  def create_magic_nav_yml
    copy_file("config/magic_nav.yml", "config/rails_admin/magic_nav.yml")
  end

  def create_rails_admin_ui_js
    copy_file("app/assets/javascripts/ui.js", "app/assets/javascripts/rails_admin/custom/ui.js")
  end

end
