class Admin::ArticlesController < Admin::RootController
  # GET /admin_articles
  # GET /admin_articles.xml
  def index
    @articles = ::Article.paginate :page=>params[:page], :per_page=>20

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_articles }
    end
  end

  # GET /admin_articles/1
  # GET /admin_articles/1.xml
  def show
    @article = ::Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /admin_articles/new
  # GET /admin_articles/new.xml
  def new
    @article = ::Article.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /admin_articles/1/edit
  def edit
    @article = ::Article.find(params[:id])
    @article_content = @article.article_content
  end

  # POST /admin_articles
  # POST /admin_articles.xml
  def create
    @article = ::Article.new(params[:article])
    @article_content = ArticleContent.new(params[:article_content])
    @article_content.article = @article
    @article.save
    @article_content.save
    respond_to do |format|
      if @article.save
        format.html { redirect_to(admin_articles_path, :notice => '::Article was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /admin_articles/1
  # PUT /admin_articles/1.xml
  def update
    @article = ::Article.find(params[:id])
    @article_content = @article.article_content
    respond_to do |format|
      if @article_content.update_attributes(params[:article_content]) and @article.update_attributes(params[:article])
        format.html { redirect_to(admin_articles_path, :notice => '::Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /admin_articles/1
  # DELETE /admin_articles/1.xml
  def destroy
    @article = ::Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_url) }
      format.xml  { head :ok }
    end
  end
end
