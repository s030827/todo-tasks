Rails.application.routes.draw do
root 'tasks#index'

resource :categories
resource :tasks, except: :show
end
