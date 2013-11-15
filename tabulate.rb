require 'date'

subtotal = []
while true
  puts "What is the sale price?"
  sale_price = gets.chomp.downcase
  if (sale_price.to_f <= 0 || sale_price =~ /([a-zA-Z]|(\.\d{3,}$|\.{2,}))/) && sale_price != "done"
    puts "Invalid input. Try again."
  elsif sale_price != "done"
    subtotal << sale_price.to_f
    puts "Subtotal: $#{sprintf('%.2f', subtotal.inject(:+))}"
    amount_due = subtotal.inject(:+)
  end

  if sale_price == "done"
    puts "Here are your item prices:"
    subtotal.each do |price|
      puts "$#{sprintf('%.2f', price)}"
    end
    puts "The total amount due is: $#{sprintf('%.2f', amount_due)}"
    break
  end
end

puts "What is the amount given?"
given = gets.chomp

if given.to_f <= 0 || given =~ /[a-zA-Z]/
  puts "Invalid input. Please try again."
  abort
end

if amount_due.to_f <= given.to_f
  change = given.to_f - amount_due.to_f
  puts "Thank you! The change given will be $#{sprintf('%.2f', change)}"
  puts "Date: " + Time.new.strftime("%Y %B %d, %I:%M%p")
  abort
else
  change = amount_due.to_f - given.to_f
  puts "Customer still needs to pay $#{sprintf('%.2f', change)}! Exiting program..."
  abort
end
