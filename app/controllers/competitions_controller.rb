class CompetitionsController < ApplicationController
  before_action :authenticate_user!, only: [:next]

  # 次のコンペティションの情報を返却
  def next
    next_competition = Competition.
                         where('ends_at > ?', Time.current).
                         order('starts_at').
                         first

    if next_competition.nil?
      # TODO 存在しなかったときの返却値は要検討
      serialized_next_competition = {CompetitionId: nil,
                                     CompetitionName: nil,
                                     startsAt: nil,
                                     endsAt: nil,
                                     isRunning: false
                                    }
    else
      is_running = (next_competition.starts_at < Time.current) and
                   (next_competition.ends_at > Time.current)

      serialized_next_competition = {CompetitionId: next_competition.id,
                                     CompetitionName: next_competition.title,
                                     startsAt: next_competition.starts_at,
                                     endsAt: next_competition.ends_at,
                                     isRunning: is_running
                                    }
    end

    render json: serialized_next_competition
  end
end
