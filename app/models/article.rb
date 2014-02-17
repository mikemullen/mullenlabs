class Article < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "400>", :thumb => "100>" }, :default_url => "/images/:style/missing.png"
	default_scope -> { order('sort_date DESC') }
end
