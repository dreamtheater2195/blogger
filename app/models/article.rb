class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings #an article has a list of tags through the relationship of taggings

	def tag_list

	end

	def tag_list=(tags_string)
  		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq   #uniq: remove dups
  		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  		self.tags = new_or_found_tags
	end
end

