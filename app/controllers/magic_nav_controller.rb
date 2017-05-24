class RailsAdmin::MagicNavController < ApplicationController

  before_action :authenticate_admin!

  def index
    # @nav_labels = NavLabel.all
    # @page_conts = PageContainer.includes(:intro_blocks, :content_blocks)
    @nav = YAML.load_file('./config/rails_admin/magic_nav.yml')

    render layout: false
  end

end
