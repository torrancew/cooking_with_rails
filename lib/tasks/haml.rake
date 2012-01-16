require 'haml/html'

# Many thanks to screencasts.org:
# http://screencasts.org/episodes/using-haml-with-rails-3

namespace :haml do
  desc "Convert ERB to Haml"
  task :erb2haml do
    
    project_dir = Rails.root

    Dir["#{project_dir}/app/views/**/*.erb"].each do |file_name|
      haml_file_name = file_name.gsub(/erb$/, "haml")
      
      if !File.exist?(haml_file_name)
        erb_string  = File.open(file_name).read
        haml_string = Haml::HTML.new(erb_string, :erb => true).render
   
        File.new(haml_file_name, "w") do
          f.write(haml_string)
        end
   
        File.delete(file_name)
      end
    end
    
  end
end
