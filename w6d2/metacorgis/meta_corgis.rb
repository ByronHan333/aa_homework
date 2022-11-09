class SnackBox
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

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end


class MetaCorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
    # @snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end

  # def method_missing(name, *args)
  #   # Your code goes here...
  #   supported_methods = ['bone', 'kibble', 'treat']

  #   method_name = name.to_s
  #   if supported_methods.include?(method_name)
  #     info = @snack_box.send(:"get_#{method_name}_info", @box_id)
  #     tastiness = @snack_box.send( :"get_#{method_name}_tastiness", @box_id)
  #     result = "#{method_name}: #{info}: #{tastiness} "
  #     tastiness > 30 ? "* #{result}" : result
  #   else
  #     super
  #   end
  # end


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


# MetaCorgiSnacks.define_snack(:bone)
# MetaCorgiSnacks.define_snack(:kibble)
snack_box = SnackBox.new
# puts snack_box.get_kibble_info(1)
# puts snack_box.get_kibble_tastiness(2)
meta_snacks = MetaCorgiSnacks.new(snack_box, 1)
# puts meta_snacks.bone
# puts meta_snacks.kibble
snack_box.methods.grep(/^get_(.*)_info$/) {test $1}
