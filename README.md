Deployed version on Heroku:https://sheltered-refuge-8625.herokuapp.com/

Email Service - for the Uber coding challenge

This is one of the Uber coding challenge project.

###The problem:

Create a service that accepts the necessary information and sends emails. It should provide an abstraction between two different email service providers. If one of the services goes down, your service can quickly fail over to a different provider without affecting your customers.

###The solution:

I created a service that sends the email to the recipient. For sending input field: from, to subject should not be empty. I used SendGrid and Mailgun. The service always try to use Sendgrid first and if something goes wrong, the service try to use Mailgun for sending email. 
I decided to use  Rubby on Rails, becouse I have more experience with it, but I also would like to write this app with using another technology like Python.

####If I had more time, I would...

      1. Improve the style for desktop view and add style for mobile devices.
      2. Add attachments, several recipients.
      3. Implement a endpoint to track the emails are sent/ not sent.


