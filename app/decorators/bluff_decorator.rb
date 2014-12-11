class BluffDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def like_button
    link_to "like", like_match_bluff_path(match, bluff), method: :post unless current_user.liked?(model)
  end

end