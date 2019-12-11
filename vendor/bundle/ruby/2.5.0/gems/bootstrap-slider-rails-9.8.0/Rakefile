require 'bundler/gem_tasks'
require 'fileutils'

desc 'Update the Bootstrap-slider Javascript and CSS files'
task :update do
  def download(version)
    base_url = 'https://raw.githubusercontent.com/seiyria/bootstrap-slider'
    puts "Downlading Bootstrap-slider #{version} ..."
    js = system("curl -fo vendor/assets/javascripts/bootstrap-slider.js " \
                "#{base_url}/v#{version}/dist/bootstrap-slider.js")
    css = system("curl -fo vendor/assets/stylesheets/bootstrap-slider.css " \
                 "#{base_url}/v#{version}/dist/css/bootstrap-slider.css")

    puts 'ERROR: Unable to fetch the Javascript file !' unless js
    puts 'ERROR: Unable to fetch the CSS file !' unless css
    exit 1 unless js || css
  end

  FileUtils.mkdir_p('vendor/assets/javascripts')
  FileUtils.mkdir_p('vendor/assets/stylesheets')
  download(BootstrapSlider::Rails::VERSION)
  puts "\e[32mDone!\e[0m"
end
