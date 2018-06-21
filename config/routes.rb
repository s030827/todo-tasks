Rails.application.routes.draw do
root 'task#index'

resource :categories
resource :tasks
end
