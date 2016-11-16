class HashSerializer
  class << self
    def dump(obj)
      obj.to_json
    end

    def load(hash)
      ((hash.is_a?(String) ? JSON.parse(hash) : hash) || {}).with_indifferent_access
    end
  end
end
