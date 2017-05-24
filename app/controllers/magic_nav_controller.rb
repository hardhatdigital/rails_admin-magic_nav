class RailsAdmin::MagicNavController < ApplicationController

  before_action :authenticate_admin!

  def index
    @nav = YAML.load_file('./config/rails_admin/magic_nav.yml')

    render layout: false
  end

end
