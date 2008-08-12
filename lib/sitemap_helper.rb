module SitemapHelper

  def change_frequency(section)
    case
    when section.blog?  : Mephisto::Plugin['sitemap'].blog_frequency
    when section.paged? : Mephisto::Plugin['sitemap'].page_frequency
    end
  end
  
  def location(site, article)
    Mephisto::Plugin['sitemap'].site_uri + site.permalink_for(article)
  end
  
  def articles_for_section(section)
    returning [] do |articles|
      Article.with_published{ articles.concat(section.articles(true)) }
    end
  end

  def lastmod(article)
    (article.comments.maximum(:updated_at) || article.updated_at).xmlschema
  end
end