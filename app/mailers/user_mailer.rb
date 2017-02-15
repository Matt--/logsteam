class UserMailer < ApplicationMailer
	default from: 'address@example.com'

	def welcome_email(user)
		@user = user
		@url = 'spiffjigg'
		mail(to: @user.email,subject: 'this is a subject title')

	end
end
