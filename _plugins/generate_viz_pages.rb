require 'yaml'

module Jekyll
  class VisualizationPageGenerator < Generator
    safe true

    def generate(site)
      # Load visualization data
      viz_data_path = File.join(site.source, '_data', 'visualizations.yml')
      
      if File.exist?(viz_data_path)
        visualizations = YAML.load_file(viz_data_path)['visualizations']
        
        visualizations.each do |viz|
          # Create visualization page
          viz_page_path = File.join(site.source, 'pages', 'viz', "#{viz['id']}.md")
          
          # Only create the file if it doesn't exist
          unless File.exist?(viz_page_path)
            FileUtils.mkdir_p(File.dirname(viz_page_path))
            
            File.open(viz_page_path, 'w') do |file|
              file.puts "---"
              file.puts "layout: visualization"
              file.puts "title: #{viz['title']}"
              file.puts "vizid: #{viz['id']}"
              file.puts "---"
              file.puts
              file.puts viz['description']
              file.puts
            end
            
            # Add the page to Jekyll's pages
            site.pages << Jekyll::Page.new(site, site.source, File.join('pages', 'viz'), "#{viz['id']}.md")
          end
        end
      end
    end
  end
end