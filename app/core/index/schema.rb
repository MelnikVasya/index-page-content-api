class Index::Schema < Dry::Validation::Schema
  define! do
    required(:url).filled(:str?, format?: URI.regexp)
    required(:tags).value(type?: Hash, min_size?: 1)
  end
end
