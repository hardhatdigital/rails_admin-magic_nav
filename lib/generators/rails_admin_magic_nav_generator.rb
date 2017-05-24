class RailsAdminMagicNavGenerator < Rails::Generators::Base
  def create_initializer_file
    create_file "config/initializers/cholo.rb", "# Add initialization content here"
  end
end
