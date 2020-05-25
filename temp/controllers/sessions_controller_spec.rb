# require 'rails_helper'

# RSpec.describe SessionsController, type: :controller do

#   describe "GET #new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #create" do
#     it "returns http success" do
#       get :create
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #failure" do
#     it "returns http success" do
#       get :failure
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #destroy" do
#     it "returns http success" do
#       get :destroy
#       expect(response).to have_http_status(:success)
#     end
# end
  

#   describe "GET #new" do
#     it "index should be successful" do
#     auth_hash = FactoryGirl.build(:auth_hash)
#     get :index
#     assigns(:auth_hash).should eq([auth_hash])   
#     end
    
#     it "new should be successful" do
#         get :new
#         assert_response :success
#     end   
  
#   describe 
    
# end
# end

require 'rails_helper'
describe SessionsController, type: :controller do
    before do
     #Auth Hash
     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github] 
    end
    
    describe "#create" do
        #create session controller
        let(:user) { instance_double('User', name: 'Onkar', email: 'okulkar4@binghamton.edu')}
        let(:auth_id) { instance_double('Authorization', provider: 'github', uid: '12346') }
        let(:auth_with) { instance_double('Authorization', provider: 'github', uid: '12346', user_id: 1) }
                  
        it "Authorize to log with Github" do
           allow(controller).to receive(:session?).and_return(false)
           allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
           expect(User).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]['info']).and_return(user)
           post :create, provider: :github
      end
    end
    
    describe "#failure" do
    end
    
    describe "#destroy" do
        before do 
        controller.session[:user_id] = "1"
        end
        let(:id_1) {"1"}
        # let(:id_1) {"1"}
        let(:user) { instance_double('User', name: 'Onkar', email: 'okulkar4@binghamton.edu') }
        let(:auth_id) { instance_double('Authorization', provider: 'github', uid: '12346') }
        let(:auth_with) { instance_double('Authorization', provider: 'github', uid: '12346', user_id: 1) }
        # let(:params){{name: "Murray street 56"}}
        it 'Delete property from system' do
            allow(User).to receive(:find).with(id_1).and_return(user)
            allow(Authorization).to receive(:find).with(id_1).and_return(user)
            #   expect().to receive(:destroy)
            delete :destroy, :id => id_1
            expect(flash[:notice]).to  match(/Onkar has logged out/)
        end
    end
end
