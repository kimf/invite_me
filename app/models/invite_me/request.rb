module InviteMe
  class Request < ActiveRecord::Base

    before_validation :downcase_email

    #validations
    validates :email, presence: true, uniqueness: true, email: true


    def downcase_email
      self.email = self.email.downcase
    end

    def invite
      return false if self.invited?
      self.update_attribute(:invited_at, DateTime.now)
    end

    def invited?
      self.invited_at.present?
    end
  end
end
