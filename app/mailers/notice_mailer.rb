class NoticeMailer < ApplicationMailer
	default from: Rails.application.secrets.account_email

	def send_email(email,subject)
		@email = email
		@subject = subject
		mail(to: @email, subject: @subject)
	end
end
