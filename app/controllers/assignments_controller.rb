class AssignmentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]

  def show
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
        OR (assignments.user_id = :user_id);
    SQL
    assignments = Assignment.find_by_sql([sql, {user_id: current_user.id}])

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
      {imageId: assignment.image.id,
       imageUrl: assignment.image.url
      }
    end

    render json: responses
  end

  def new
    annotations = params[:annotations].map do |annotation|
      {assignment_id: annotation[:assignmentId].to_i,
       annotation_label_id: annotation[:annotation].to_i,
       user_id: current_user.id,
       created_at: Time.current,
       updated_at: Time.current,
      }
    end

    Annotation.insert_all(annotations)
  end
end
