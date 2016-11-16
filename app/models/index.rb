class Index < ApplicationRecord
  store_accessor :tags, :h1, :h2, :h3, :a
  serialize :tags, HashSerializer
end
