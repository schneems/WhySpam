begin
  require 'deadweight'
rescue LoadError
end

desc 'run deadweight css check (requires script/server)'
task :deadweight do
  dw = Deadweight.new
  dw.stylesheets = ["/stylesheets/why.css"]
  dw.pages = ["/", "", "", ]
  puts dw.run
end