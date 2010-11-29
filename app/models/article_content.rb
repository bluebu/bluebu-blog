class ArticleContent < ActiveRecord::Base
  before_save :generate_short_content
  belongs_to :article
  
  
  def generate_short_content
    helper = ActionController::Base.helpers
    content = helper.truncate(helper.strip_tags(self.content).gsub(/\s/i,''),:length=>255).strip
    self.article.content = content
    self.article.save
  end
  
  
end
