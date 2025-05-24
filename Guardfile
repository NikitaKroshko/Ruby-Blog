# Guardfile
# LiveReload + TailwindCSS rebuild on changes

guard 'livereload' do
  extensions = {
    css: :css,
    scss: :css,
    sass: :css,
    js: :js,
    coffee: :js,
    html: :html,
    png: :png,
    gif: :gif,
    jpg: :jpg,
    jpeg: :jpeg,
  }

  rails_view_exts = %w(erb haml slim)

  # Watch compiled assets (public-facing)
  compiled_exts = extensions.values.uniq
  watch(%r{public/.+\.(#{compiled_exts * '|'})})

  # Watch app/vendor asset files
  extensions.each do |ext, type|
    watch(%r{
          (?:app|vendor)
          (?:/assets/\w+/(?<path>[^.]+)
           (?<ext>\.#{ext}))
          (?:\.\w+|$)
          }x) do |m|
      path = m[1]
      "/assets/#{path}.#{type}"
    end
  end

  # Watch views, helpers, locales
  watch(%r{app/views/.+\.(#{rails_view_exts * '|'})$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{config/locales/.+\.yml})
end

guard :shell, all_on_start: true, run_on_modifications: true do
  watch(%r{^tailwind\.config\.js$}) { run_tailwind }
  watch(%r{^app/assets/stylesheets/.*\.css$}) { run_tailwind }

  def run_tailwind
    puts "==> Rebuilding Tailwind CSS with explicit config from project root..."
    system("npx tailwindcss -c ./tailwind.config.js -i ./app/assets/stylesheets/application.css -o ./app/assets/builds/application.css --watch")
  end
end

