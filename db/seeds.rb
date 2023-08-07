# Create Users with Messages
user1 = User.create(
  email: "user1@example.com",
  password: "password",
  messages: [
    Message.new(phone_number: "1234567890", body: "Hello from User 1!"),
    Message.new(phone_number: "9876543210", body: "Another message from User 1!"),
  ],
)

# Create Users with Messages
user2 = User.create(
  email: "user2@example.com",
  password: "password",
  messages: [
    Message.new(phone_number: "5551234567", body: "Hey there, User 2 here."),
    Message.new(phone_number: "9998887777", body: "Last message from User 2."),
  ],
)

puts "Seed data created!"
