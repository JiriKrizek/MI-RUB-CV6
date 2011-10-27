require 'thread'

queue = Queue.new
counts = Hash.new(0)

File.foreach("testfile") do |line|
  line.scan(/\w+/) do |word|
    queue << word.downcase
    puts "Adding word #{word.downcase}"
  end
end

consumer = Thread.new do
  while(!queue.empty?)
    value = queue.pop
    counts[value] += 1
  end
  counts.keys.sort.each {|k|
    print "#{k}: #{counts[k]}; \t"
  }
end

consumer.join