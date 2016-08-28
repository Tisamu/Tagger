class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :user, class_name: "User"
  
  validates_format_of :message, with: /([^<>]+[\S]+)/
  validates_format_of :tag, with: /\A.[^<>]+\z/
  validates :tag, presence: true, on: :create

  # This Method is user to get the top ten used Tags
  def Post.tag_top_ten
    # Create a new empty array
    tag_list = Array.new
    # Get list of uniq different tags presents in the post table
    Post.distinct.pluck(:tag).each do |tag|
      # Fill the tag_list array with the name of the tag and the number of times this tag is present in the post table
      tag_list.push({name: tag,
                    count: Post.where(tag: tag).length})
    end
    # And return the top ten of the tags
    # That consists in Ordering the array by descreasing count number and just taking the ten first.
    return tag_list.sort_by{|t| -t[:count]}.take(10)
  end


end
