class ItemsController < ApplicationController
  def index
    # 必要な処理を書く
  end

  private

  def Item_params
    params.require(:Item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
