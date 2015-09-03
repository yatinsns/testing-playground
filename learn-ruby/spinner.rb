# coding: utf-8
def show_wait_spinner(fps=10)
  chars = %w[| / - \\]
  delay = 1.0/fps
  iter = 0
  spinner = Thread.new do
    while iter do  # Keep spinning until told otherwise
      print "\e[34m", chars[(iter+=1) % chars.length], "\e[0m"
      sleep delay
      print "\b"
    end
  end
  yield.tap{       # After yielding to the block, save the return value
    iter = false   # Tell the thread to exit, cleaning up after itself…
    spinner.join   # …and wait for it to do so.
  }                # Use the block's return value as the method's
end

print "Doing something tricky..."
show_wait_spinner{
  sleep rand(4)+2 # Simulate a task taking an unknown amount of time
}
puts "Done!"
