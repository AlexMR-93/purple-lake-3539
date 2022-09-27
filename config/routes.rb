  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources(:departments,   only: [:index])

  resources(:employees,   only: [:show]) do
    resources(:tickets,     only: [:show])
  end
end
