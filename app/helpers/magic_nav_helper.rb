module RailsAdmin::MagicNavHelper

  def to_model_name link_string
    if link_string.start_with? "{{FIND}}"
      link_string.split("|")[1].singularize
    end
  end

  def build_link link_string
    # Example link which finds intro_blocks for a given page containter:
    # /admin/intro_block?f[page_container_id][0][o]=default&f[page_container_id][0][v][]=6
    # ex. link_string {{FIND}}|page_container|{{HAS_SLUG}}|what-we-do

    if link_string.start_with? "{{FIND}}"
      split_s  = link_string.split("|")
      model    = split_s[1].singularize
      method   = split_s[2]
      argument = split_s[3]

      if method.include? "HAS_SLUG"
        build_by_slug(model, argument)
      elsif method.include? "BELONGS_TO"
        build_by_belongs_to(model, argument)
      end

    else
      "/admin#{link_string}"
    end
  end

  def build_by_belongs_to model, associated_record_slug
    split_s       = associated_record_slug.split(":")
    parent_model  = split_s[0]
    slug          = split_s[1]
    klass         = to_klass(parent_model)
    parent_record = klass.find_by_slug(slug)
    records       = parent_record.public_send(model.pluralize) if parent_record

    if records && records.length == 1
      # only one record, so go straight to it
      "/admin/#{model}/#{records.first.id}/edit"
    elsif parent_record.try(:id)
      # if there's a page container, find all records for it
      "/admin/#{model}?f[#{parent_model}_id][0][o]=default&f[#{parent_model}_id][0][v][]=#{parent_record.id}"
    else
      # otherwise, just find all records for that model, because something's gone wrong
      "/admin/#{model}"
    end
  end

  def build_by_slug model, slug
    klass = to_klass(model)
    id    = klass.find_by_slug(slug).id

    "/admin/#{model}/#{id}/edit"
  end

  def to_klass model
    Object.const_get model.titleize.gsub(/\s+/, "")
  end

end
