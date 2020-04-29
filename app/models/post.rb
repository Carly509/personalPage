class Post < ApplicationRecord
    # belongs_to :user
    belongs_to :category
    validates :category_id, presence: true
    has_many :line_items, inverse_of: :order
    has_many :comments, dependent: :destroy 
    #default_scope -> { order(created_at: :desc) }
    mount_uploader :picture, PictureUploader
    # validates :user_id, presence: true
    has_rich_text :content
    validates :content, presence: true, length: { maximum: 140 }
    validate  :picture_size

      #   # friendly url
      extend FriendlyId
      friendly_id :title, use: :slugged

    def increment(by = 1)
      self.views ||= 0
      self.views += by
      self.save
    end

    # callbacks
  before_save :anti_spam

  def anti_spam
    doc = Nokogiri::HTML::DocumentFragment.parse(self.content)
    doc.css('a').each do |a|
      a[:rel] = 'nofollow'
      a[:target] = '_blank'
    end
    self.content = doc.to_s
  end

    # def popular
    #   Post.includes(:views).all.map { |p| [p.id, p.name, p.views.size] }
    # end
  
    private

  
      # Validates the size of an uploaded picture.
      def picture_size
        if picture.size > 10.megabytes
          errors.add(:picture, "should be less than 5MB")
        end
      end

      def self.search(content)
        where("content like ?", "%#{content}%")
      end
  
  end
  