module Mrrobot
  module HashHelper
    def symbolize_keys(hash)
      new_hash = {}
      hash.each do |key, val|
        new_hash[key&.to_sym || key] = val
      end
      new_hash
    end
  end
end
