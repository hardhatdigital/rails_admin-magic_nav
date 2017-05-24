class RailsAdminMagicNavGenerator < Rails::Generators::Base
  def create_initializer_file
    create_file "config/initializers/rails_admin_magic_nav.rb", "# Add initialization content here"
  end
end
