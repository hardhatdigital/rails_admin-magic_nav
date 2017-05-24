class RailsAdminMagicNavGenerator < Rails::Generators::Base

  source_root File.expand_path("../../../", __FILE__)

  def create_magic_nav_yml
    copy_file("config/magic_nav.yml", "config/rails_admin/magic_nav.yml")
  end
end
