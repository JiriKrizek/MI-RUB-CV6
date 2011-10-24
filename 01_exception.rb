class MyError < StandardError
end

begin 
  raise "kk"
rescue StandardError=>e
  puts e
  p caller
  p e.backtrace
  puts "StandardError"
rescue MyError=>e
  puts "MyError"
end