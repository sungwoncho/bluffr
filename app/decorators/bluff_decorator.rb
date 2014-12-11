class BluffDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def like_button
    link_to "like", likes_path(id: bluff), method: :post unless current_user.liked?(model)
  end

  def unlike_button
    link_to "unlike", like_path(bluff), method: :delete if current_user.liked?(model)
  end

  def author_name
    author.username
  end

  def like_count
    likes.count
  end

end
