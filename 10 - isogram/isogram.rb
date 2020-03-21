class Isogram
  def self.isogram?(input)
    normalized = input.gsub(/[^0-9A-Za-z]/, '').downcase.chars
    if normalized.count == normalized.uniq.count
      "Expected true, '#{input}' is an isogram"
      true
    else
      "Expected false, '#{input}' is not an isogram"
      false
    end
  end
end