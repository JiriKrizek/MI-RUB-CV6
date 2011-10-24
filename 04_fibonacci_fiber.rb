fibonacci = Fiber.new do
    a=0
    b=1
    Fiber.yield a
    Fiber.yield b
    
    while true
      Fiber.yield a+b
      tmp=b
      b=a+b
      a=tmp
    end
end

for i in (0..100) do
  value = fibonacci.resume
  puts value
end