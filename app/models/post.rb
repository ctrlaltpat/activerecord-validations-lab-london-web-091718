class Post < ActiveRecord::Base

  validates :title, presence: true#, clickbait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    checks = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    clickbaity = checks.any? { |check| check.match title }
    # binding.pry
    if !clickbaity
      errors.add(:title, "Not Clickbait-y")
    end
  end
end
