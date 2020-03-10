class Categoty < ActiveRecord
    
    validates :name,  present:true,  length:{minimum:3, maximum:25}
    validates_uniqueness_of :name
end
