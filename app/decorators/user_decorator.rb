class UserDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def joined_date
    model.created_at.strftime("%-d %b %Y")
  end

  def bluff_count
    authored_bluffs.count
  end

  def like_count
    liked_bluffs.count
  end
end
