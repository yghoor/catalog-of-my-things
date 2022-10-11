# rubocop:disable Metrics/MethodLength

def main
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
      puts 'List of all books:'
      puts '------------------'
    when '2'
      puts 'List of all labels:'
      puts '-------------------'
    when '3'
      puts 'Add a book:'
      puts '-----------'
    when '4'
      puts 'Thanks you for using this app'
    end

    puts "\n"
  end
end

# rubocop:enable Metrics/MethodLength

main
