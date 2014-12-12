class BluffDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def like_button
    if user_signed_in?
      link_to "like", likes_path(id: bluff), method: :post unless current_user.liked?(model)
    end
  end

  def unlike_button
    if user_signed_in?
      link_to "unlike", like_path(bluff), method: :delete if current_user.liked?(model)
    end
  end

  def delete_button
    link_to "delete", match_bluff_path(model.match.id, model), method: :delete if model.author == current_user
  end

  def author_name
    author.username
  end

  def authored_date
    model.created_at.strftime('%-d %b %Y %-l:%M %p')
  end

  def like_count
    likes.count
  end

end
