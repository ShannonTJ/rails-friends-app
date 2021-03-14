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

end
