# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
Rack::Mime::MIME_TYPES['.woff'] = 'application/x-font-woff'
Rack::Mime::MIME_TYPES['.otf'] = 'application/x-font-opentype'
Mime::Type.register "image/svg+xml", :svg