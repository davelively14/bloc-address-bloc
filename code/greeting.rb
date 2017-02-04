def greeting
  (1...ARGV.length).each { |i| puts "#{ARGV[0]} #{ARGV[i]}" }
end

greeting
