# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'javascripts')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'stylesheets')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts')


# Precompile the maps

Rails.application.config.assets.precompile += %w[maps.scss]
Rails.application.config.assets.precompile += %w[main_map.js]
Rails.application.config.assets.precompile += %w[new_event_map.js]
Rails.application.config.assets.precompile += %w[edit_event_map.js]
Rails.application.config.assets.precompile += %w[show_event_map.js]
