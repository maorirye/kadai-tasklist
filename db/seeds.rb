(1..100).each do |number|
  Task.create(status: 'test', content: 'test content ' + number.to_s)
end