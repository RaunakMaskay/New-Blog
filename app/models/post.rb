class Post < ActiveRecord::Base
		 #attr_accessible :context, :name, :title
		 
		validates :name, :presence => true

end
