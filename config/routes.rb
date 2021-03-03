Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get 'competitions/next'
  get 'leader_board', to: 'leader_board#index'
  get 'assignment', to: 'assignments#show'  # URLは/assignmentで単数形
end
