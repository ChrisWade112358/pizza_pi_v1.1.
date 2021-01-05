class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def name
    name = "#{first_name} #{last_name}"
   end

  


end
