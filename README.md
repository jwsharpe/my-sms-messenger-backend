Hosted Here:
https://my-sms-messenger-frontend.onrender.com/

Frontend Code Here:
https://github.com/jwsharpe/my-sms-messenger-frontend

## Summary

This is a frontend and backend for an SMS Messenger Service.

## Frontend

The frontend consists of 2 pages,
The first page consists two forms, a Sign Up form and a Sign In form.
The second page consists of two main components an SMS Submission Form and SMS Sent History.

### Sign In / Sign Up Page

This is the index page, there is a form to sign in and another to sign up.
The sign up form asks for email & password and a password confirmation.
The sign in form asks for email & password.

### SMS Submission Form

The SMS submission form which contains the following fields:

- phoneNumber
- message

The form itself also contains a couple of various validation and support features.

The ability to submit the form using a submit button.
The ability to clear the form using the clear button.
And a message length check validator to avoid subtmiting an invalid SMS. - This length check validator for the message will let you run over the character limit, but will prevent the submit button from being pressed.

### SMS Sent History

The SMS Sent History will interact with the backend and show a log of all messages for a user with the following:

The phone number we sent to.
The datetime in UTC.
The message content.
The length of the string.

## Backend

The backend will consist of a ruby on rails server and postgres db.

### Models

User
id: int
uuid: string
username: string
password_hash: string
created_on: datetime
updated_on: datetime

Message
id: int
user_id: int
phone_number: string
message: string
created_on: datetime
updated_on: datetime

### Endpoints

GET /messages
{ x-api-key: uuid }
Expected Responses
200 OK - Returns list of messages associated to the user id.
401 Unauthorized - if apikey is incorrect/missing
404 Not Found - if returned list is empty

POST /messages
{ x-api-key: uuid }
{ phoneNumber, message }
Expected Responses
201 Created
400 Bad Request - if phoneNumber/message is empty.
401 Unauhtorized - if apikey is incorrect/missing

### Webhook

/message_webhook
