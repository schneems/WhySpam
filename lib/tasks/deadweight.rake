begin
  require 'deadweight'
rescue LoadError
end

desc 'run deadweight css check (requires script/server)'
task :deadweight do
  dw = Deadweight.new
  dw.stylesheets = ["/stylesheets/form.css"]
  dw.pages = ["/forms/foreign_show/ZRQ"]
  puts dw.run
end