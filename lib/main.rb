#!../../../../../bin/env ruby

# rubocop:disable Metrics/MethodLength

require_relative './app'

def main
  app = App.new

  response = nil

  puts "Welcome to Catalougue Of My Things App!\n\n"

  while response != '4'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all labels'
    puts '3 - Add a book'
    puts '4 - Exit'

    response = gets.chomp

    case response
    when '1'
      app.display_books
    when '2'
      app.display_labels
    when '3'
      app.add_book
    when '4'
      puts 'Thank you for using this app'
    end

    puts "\n"
  end
end

# rubocop:enable Metrics/MethodLength

main
