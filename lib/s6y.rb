class S6y
  class << self
    def shortify(value)
      value.to_s.split(/\b/).collect do |v| 
        (v.length > 2 && v[0,1] =~ /[a-zA-Z]/) ? "#{v[0,1]}#{v.length-2}#{v[-1,1]}" : v
      end.join
    end
  end
end