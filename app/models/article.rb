class Article < ApplicationRecord
    has_many :taggings,
    dependent: :delete_all
    has_many :tags, through: :taggings,
    dependent: :delete_all
    has_many :coments,
    dependent: :delete_all
    

    def tag_list
        self.tags.collect do |tag|
            tag.name

        end.join(", ")
     
    end
    def tag_list=(tags_string)
        tag_names=tags_string.split(",").collect{|s| s.strip.downcase }.uniq
        new_or_found_tags= tag_names.collect{|n| Tag.find_or_create_by(name: n) }  
        self.tags =new_or_found_tags
    end
    has_attached_file :image, styles: {medium: "300x300>",thumb: "100x100>"}
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    
    
end
