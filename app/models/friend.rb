class Friend < ApplicationRecord
    belongs_to :user

    before_save :set_email, :set_phone, :set_twitter

    def set_email
        self.email = "(no email)" if self.email.blank?
    end

    def set_phone
        self.phone = "(no phone #)" if self.phone.blank?
    end

    def set_twitter
        self.twitter = "(no twitter)" if self.twitter.blank?
    end

    def self.search(search)
        if search 
            where(["lower(first_name) LIKE lower(?) OR lower(last_name) LIKE lower(?) OR lower(email) LIKE lower(?) OR lower(phone) LIKE lower(?) OR lower(twitter) LIKE lower(?)", "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%","%#{search}%"])
        else 
            all
        end
    end

end
