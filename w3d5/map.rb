class Map
  def initialize
    @data = []
  end

  def set(key, value)
    found = false
    @data.each do |sub|
      if sub[0] == key
        sub[1] = value
        found = true
      end
    end
    @data << [key, value] unless found
  end

  def get(key)
    s = @data.select{|sub| sub[0]==key}
    return s == [] ? nil : s[0][1]
    # [1]
  end

  def delete(key)
    @data.delete_if{|sub| sub[0]==key}
  end

  def show
    @data.each{|sub| print "#{sub[0]} => #{sub[1]}\n"}
  end
end

m = Map.new()
m.set('a',1)
m.set('a',2)
m.set('b',3)
m.set('c',4)
m.show
p m.get('a')
p m.get('z')
m.delete('a')
m.delete('z')
m.show
