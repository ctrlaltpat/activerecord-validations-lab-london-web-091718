class Post < ActiveRecord::Base

  validates :title, presence: true#, clickbait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    clickbaity_words = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    clickbaity = clickbaity_words.any? { |word| word.match title }
    # binding.pry
    if !clickbaity
      errors.add(:title, "Not Clickbait-y")
    end
  end
end
