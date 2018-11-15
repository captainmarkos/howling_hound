require 'rails_helper'

RSpec.describe 'Users #index', type: :request do
  before(:all) do
    @user1 = create(:user)
  end

  it '#index' do
    get users_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end
end

RSpec.describe 'Users #show', type: :request do
  context 'GET /users/:id' do
    it 'responds with 200 and shows user' do
      user = create(:user)
      get user_path(user.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  # another variation
  context 'GET /users/:id' do
    it 'responds with 200' do
      user = create(:user)

      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end
end

RSpec.describe 'Users #new and #create', type: :request do
  context 'GET /users/new' do
    it 'creates a User and redirects to the User edit page' do
      get new_user_path
      expect(response).to render_template(:new)

      post '/users', params: { user: { first_name: 'Joe',
                                       email: 'joeblow@yahoo.com' } }

      expect(response).to redirect_to(edit_user_path(User.first.id))
      expect(response).to redirect_to(edit_user_url(User.first.id))

      follow_redirect!

      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
      expect(response.body).to include('joeblow@yahoo.com')
    end
  end
end
