




Factory.define :website do |f|
  f.sequence(:url) { |n| "www.example#{n}.com"}
  f.grade "A+"
  f.rank 100
end

