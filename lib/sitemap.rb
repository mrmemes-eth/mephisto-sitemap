module Mephisto
  module Plugins
    class Sitemap < Mephisto::Plugin
      author 'Stephen Caudill - exdolo.com'
      version '1.0'
      homepage 'http://svn.exdolo.com/projects/plugins/mephisto_google_site_map/'
      notes 'Creates a Google Sitemap Protocol compliant XML file that describes your Mephisto blog and allows you to set some preferences on how you’d like Google to index your site (or at least suggest the same).'
      
      option :site_uri, 'http://www.example.com'
      option :home_priority, 0.9
      option :article_priority, 0.5
      option :home_frequency, 'daily'
      option :blog_frequency, 'daily'
      option :page_frequency, 'weekly'
      
      public_controller 'Sitemap'
      add_route 'sitemap.xml', :controller => 'sitemap'
    end
  end
end
