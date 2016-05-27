class HomeMailer < ApplicationMailer
    default from: 'home@redtone.com'

    def welcome(email)
        @user = email
        b = IO.binread('c:\mails\Changes Request on Collection & CN Interface report.docx')
        attachments['Changes Request on Collection & CN Interface report.docx'] = {
            mime_type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            content: b
        }
        mail(to: email, subject: 'Welcome')
    end
end
