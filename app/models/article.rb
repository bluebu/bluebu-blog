class Article < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :category,:counter_cache => true
  belongs_to :user,:counter_cache => true
  has_one :article_content, :dependent => :destroy
  
  
  def self.create_or_update_article(params)
    article = Article.first(:conditions=>{:title=>params[:article][:title]})
    if article.blank?
      article = Article.create(params[:article])
      article_content = ArticleContent.new(params[:article_content])
      article_content.article = article
      article_content.save
    else
      article.update_attributes(params[:article])
      article.article_content.update_attributes(params[:article_content])  
    end
    article
  end
  
end
