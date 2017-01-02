class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    before_save :clean_links
    
    validates_presence_of :title
    validates_presence_of :body
    
    def clean_links
        # We use DocumentFragment so Nokogiri doesn't add DOCTYPE and other HTML
        doc = Nokogiri::HTML::DocumentFragment.parse(body)
        
        doc.css('a').each do |a|
            a[:rel] = 'nofollow'
            a[:target] = '_blank'
        end
        
        self.body = doc.to_s
    end
end
