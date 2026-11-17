# Project commands. Run `just` to list them.

# macOS ships an old Ruby (2.6). If Homebrew's Ruby is installed (`brew install ruby`), use it instead
# (it is ignored on machines without it).
brew_ruby := "/opt/homebrew/opt/ruby/bin"
export PATH := if path_exists(brew_ruby) == "true" { brew_ruby + ":" + env_var("PATH") } else { env_var("PATH") }

# List the commands
default:
    @just --list

# Install the Jekyll dependencies (gems go to vendor/bundle, no sudo needed)
setup:
    bundle config set --local path vendor/bundle
    bundle install

# Serve the site on http://localhost:4000, reloads on change (restart after editing _config.yml)
serve:
    bundle exec jekyll serve --livereload

# Build the site into _site
build:
    bundle exec jekyll build

# Remove the built site and Jekyll caches
clean:
    bundle exec jekyll clean
