module Concerns::Findable
  
  def find_by_name(name_str)
    self.all.find {|s| s.name == name_str}
  end 
  
  def find_or_create_by_name(name_str)
    self.find_by_name(name_str) || self.create(name_str)
  end 
  
end 