module ApplicationHelper
  # 包含项目的js文件
  def include_js(*args)    
    js_controller = @js_controller || params[:controller]
    js_action = @js_action || params[:action]
    tags = []
    js_path = File.join(RAILS_ROOT,"public","javascripts","controllers",js_controller,"#{js_controller}_lib.js")
    js_name = "controllers/#{js_controller}/#{js_controller}_lib" if File.exists?(js_path)
    tags << javascript_include_tag(js_name) if js_name
    
    js_path = File.join(RAILS_ROOT,"public","javascripts","controllers",js_controller,"#{js_action}.js")
    js_name = "controllers/#{js_controller}/#{js_action}" if File.exists?(js_path)
    tags << javascript_include_tag(js_name) if js_name
    str = tags.join("\n") 
    return raw(str)
  end
end
