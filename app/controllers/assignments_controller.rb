class AssignmentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]

  # 一回の/assignmentで取得される画像数
  N_IMAGES_IN_ASSIGNMENT = 5

  def show
    # コンペティションが開催中か確認
    count_running_competition = Competition.
                                  where('starts_at < ?', Time.current).
                                  where('ends_at > ?', Time.current).
                                  count

    if count_running_competition == 0
      render json: {message: 'no competition is running'}, status: 200
      return
    end

    sql = <<-SQL
      WITH assignments_without_annotation AS (
        SELECT
          assignments.id
        FROM
          assignments
        WHERE
          assignments.id NOT IN (
            SELECT
              assignment_id
            FROM
              annotations
          )
      )
      SELECT
        *
      FROM
        assignments
      INNER JOIN
        assignments_without_annotation
      ON
        assignments.id = assignments_without_annotation.id
      WHERE
        (assignments.user_id IS NULL)
        OR (assignments.user_id = :user_id)
      LIMIT
        :n_images;
    SQL
    assignments = Assignment.find_by_sql([sql, {user_id: current_user.id,
                                                n_images: N_IMAGES_IN_ASSIGNMENT}])

    assignments_users = assignments.map do |assignment|
      {id: assignment.id,
       user_id: current_user.id,
       image_id: assignment.image.id,
       competition_id: assignment.competition.id,
       created_at: assignment.created_at,
       updated_at: Time.current,
      }
    end
    # FIXME assignments_usersが空の時を対応
    Assignment.upsert_all(assignments_users)

    responses = assignments.map do |assignment|
      {assignmentId: assignment.id,
       imageUrl: assignment.image.url
      }
    end

    render json: responses
  end

  def new
    # コンペティションが開催中か確認
    count_running_competition = Competition.
                                  where('starts_at < ?', Time.current).
                                  where('ends_at > ?', Time.current).
                                  count

    if count_running_competition == 0
      render json: {message: 'no competition is running'}, status: 200
      return
    end

    # FIXME 送信されてきたデータのバリデーションを追加
    annotations = params[:annotations].map do |annotation|
      {assignment_id: annotation[:assignmentId].to_i,
       annotation_label_id: annotation[:annotation].to_i,
       user_id: current_user.id,
       created_at: Time.current,
       updated_at: Time.current,
      }
    end

    Annotation.insert_all(annotations)

    render status: 200
  end
end
