require 'rails_helper'
describe PostsController, type: :controller do
    describe "#create" do
        before do 
            controller.session[:user_id] = 1
        end
        let(:id) {1}
        let(:user){instance_double('User', name: 'Onkar')}
        let(:post_1){instance_double("Post", title: "Pizza",ingredients: "Olive", location:"Binghamton",image: "one.jpg", quantity:"2", post_age: "2 hrs", user_id: "1")}
        let(:params){{title: "Pizza",ingredients: "Olive", location:"Binghamton",image: "one.jpg", quantity:"2", post_age: "2 hrs", user_id: "1"}}
        it "create" do
            allow(User).to receive(:find).with(id).and_return(user)
            expect(Post).to receive(:create!).with(params).and_return(post_1)
            post :create, user_id: id, post: params
        end
    end
end