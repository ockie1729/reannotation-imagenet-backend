class LeaderBoardController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    users = User.all.left_joins(:annotations)
              .group(:id)
              .select('users.id, users.name, COUNT(annotations.id) as count_annotations_id')
              .order('count_annotations_id desc')

    responses = users.map.with_index do |user, i|
      {userId: user.id,
       userName: user.name,
       annotationCount: user.count_annotations_id,
       rank: i+1
      }
    end

    render json: responses
  end
end
