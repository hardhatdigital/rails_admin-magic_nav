# RailsAdminMagicNav
The Magic Nav generator, replaces Rails Admin's default navigation with a navigation that can be customized by the developer.

## Usage
By configuring the `config/rails_admin/magic_nav.yml` file within your application, the navigation can be controlled.

#### Add a new section to the navigation

Under the the appropriate section, add:

```ruby
name: "Section Name"
      links:
        - []
```

#### Add direct links to a location in the admin

Add the following under your section:

```ruby
name: "Section Name"
      links:
        - ["Link to list of Users", "user"]
        - ["Link to list of Subscribers", "subscriber"]
```

#### Add A list of pages under a section

```ruby
name: "Section Name"
      pages:
        - name: "Products"
          links:
            - ["Add/Edit", "/product_service?model_name=product_service&scope=products"]
```

### Add a link that searches for a particular record by slug

Replace your link with something similar to the following:

```ruby
name: "Products"
      links:
        - ["Product A", "{{FIND}}|product|{{HAS_SLUG}}|slug-of-product-a"]
```

### Disable Magic Nav

Set `magicNav.active = false` in `app/assets/javascripts/rails_admin/custom/ui.js`
 
## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_admin_magic_nav', :git => 'https://github.com/hardhat/rails-admin-magic-nav.git'
```

And then execute:
```bash
$ bundle
```

Run the generator command:
```ruby
rails g rails_admin_magic_nav
````

Add the following to your routes file:
```ruby
get 'magic_nav' => 'rails_admin/magic_nav#index'
``


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
