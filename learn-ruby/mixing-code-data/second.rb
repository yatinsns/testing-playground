def print_second_data
  puts "Second file\n--------"
  puts DATA.read # Won't output anything, since first.rb read the entire file
end

__END__
Second end clause
