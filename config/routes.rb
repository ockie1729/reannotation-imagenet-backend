Rails.application.routes.draw do
  get 'leader_board/index'
  mount_devise_token_auth_for 'User', at: 'auth'

  get 'competitions/next'
end
