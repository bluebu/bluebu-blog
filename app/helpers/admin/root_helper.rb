module Admin::RootHelper
  #通过读取 config/menus.yml， 显示后台左侧主目录
  def admin_menus
    menus = YAML.load(File.open(File.join(Rails.root,"config","menus.yml"))) rescue nil
    return "menus.yml配置文件格式不正确" unless menus
    menus = menus["admin"]#此步骤应该动态调用角色
    render :partial => '/admin/root/menu', :locals => { :menus => menus}
  end
  
  #后台发布、未发布状态切换
  def link_to_publish_or_unpublish(model)
    return unless model.respond_to? :state
    model_name = model.class.name.underscore
    return link_to model.operational_name, {:action=>:update,:id=>model.id, model_name.to_sym => {:publish=> model.published? ? 0 : 1 }}, {:method=>:put,:confirm => "确认#{model.operational_name}吗？"}
  end
  
end
