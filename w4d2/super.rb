class User
  attr_reader :first_name, :last_name
  attr_accessor :article_count

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
    @article_count = 0
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def upvote_article(article)
    self.article_count = 1
  end
end

class SuperUser < User
  attr_reader :super_powers

  def initialize(first_name, last_name, super_powers)
    super(first_name, last_name)
    @super_powers = super_powers
  end

  def upvote_article(article)
    # extra votes
    self.article_count = 3
  end

  def delete_user(user)
    return unless super_powers.include?(:user_deletion)

    # super user is authorized to delete user
    puts "Goodbye, #{user.full_name}!"
  end
end

per = SuperUser.new('f', 'l', 'super')
# per = User.new('f', 'l')
per.upvote_article('abc')
p per
