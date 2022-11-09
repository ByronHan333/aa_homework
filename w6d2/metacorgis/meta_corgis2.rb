class MetaSnackBox
  attr_reader :data
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }

  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def render(things, box_id)
    p0, p1 = things[0], things[1]
    return @data[box_id][p0][p1]
  end

  def method_missing(name, *args)
    method_name = name.to_s
    box_id = args[0]

    if method_name.start_with?('get_')
      name_last_two_parts = method_name['get_'.length..-1].split('_')
      # print "#{name_last_two_parts}, #{box_id}\n"
      return render(name_last_two_parts, box_id)
    else
      super
    end
  end

end


class MetaCorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def method_missing(name, *args)
    # Your code goes here...
    supported_methods = ['bone', 'kibble', 'treat']

    method_name = name.to_s
    if supported_methods.include?(method_name)
      info = @snack_box.send(:"get_#{method_name}_info", @box_id)
      tastiness = @snack_box.send( :"get_#{method_name}_tastiness", @box_id)
      result = "#{method_name}: #{info}: #{tastiness} "
      tastiness > 30 ? "* #{result}" : result
    else
      super
    end
  end

  def self.define_snack(name)
    # Your code goes here...
    supported_methods = [:bone, :kibble, :treat]
    if supported_methods.include?(name)
      define_method(name) do |*args|
        info = @snack_box.send(:"get_#{name}_info", @box_id)
        tastiness = @snack_box.send( :"get_#{name}_tastiness", @box_id)
        result = "#{name}: #{info}: #{tastiness} "
        tastiness > 30 ? "* #{result}" : result
      end
    else
      raise "not supported"
    end
  end
end

MetaCorgiSnacks.define_snack(:bone)
MetaCorgiSnacks.define_snack(:kibble)


snack_box = MetaSnackBox.new
puts snack_box.get_kibble_info(1)
puts snack_box.get_kibble_tastiness(2)

meta_snacks = MetaCorgiSnacks.new(snack_box, 1)
puts meta_snacks.bone
puts meta_snacks.kibble
