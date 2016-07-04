class Article < ActiveRecord::Base
  include AASM

  belongs_to :user
  has_many :omments
  has_many :has_categories
  has_many :categories , through: :has_categories


  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 20}

  has_attached_file :cover
  after_create :save_categories
  # validates_attachment_content_type :cover, content_type:  /\Aimage\/.*\Z/
  #
  # validates_attachment_content_type :cover, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
  do_not_validate_attachment_file_type :cover
  scope :publicado, ->{where(state: "published")}

  scope :latest, ->{order("created_at DESC")}

# def self.publicados
#   Article.where(state:"published")
#
# end

  def categories=(value)
    @categories = value
  end

  aasm column: "state" do
    state :in_draft, initial: true
    state :published

    event :publish do
        transitions from: :in_draft, to: :published
    end
    event :unpublished do
          transitions from: :published, to: :in_draft
    end
  end

  private

  def save_categories

    @categories.each do |category_id|
      HasCategory.create(category_id: category_id, article_id: self.id)

  end
end



end
