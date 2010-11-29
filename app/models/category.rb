class Category < ActiveRecord::Base
  
  # 返回分类的分类，一个hash，{name=>kind_id}
  def self.categories
    return   {
      "首页" => 1,
      "博客" => 2,
      "代码库" => 3,
      "关于我" => 4
    }
  end
end
