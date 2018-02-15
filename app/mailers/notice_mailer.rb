class NoticeMailer < ApplicationMailer
	default from: "saad.mahmood@gems.techverx.com"

	def send_email(email,subject)
		@email = email
		@subject = subject
		mail(to: @email, subject: @subject)
	end
end
