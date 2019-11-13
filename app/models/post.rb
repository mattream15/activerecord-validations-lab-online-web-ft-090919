class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { :minimum => 250 }
    validates :summary, length: { :maximum => 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
    validate :clickbait


        def clickbait
            titles = [/Secret/, /Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]
            if titles.none? {|phrase| phrase.match(title)}
                self.errors[:title] << "We are only allowed to have titles that include Will Not Believe, Secret, Top [number], or Guess!"
            end  
        end
end
