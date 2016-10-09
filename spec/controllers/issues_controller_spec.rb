require 'spec_helper'

# describe IssuesController do

#   shared_examples("public access to issues") do
#     # show ============
#     describe "GET #show" do
#       before :each do
#         # allow(Issue).to receive(:find).with(issue.id.to_s).and_return(issue)
#         # get :show, id: issue 
#         issue = create(:issue)
#         get :show, id: issue    
#       end

#       it "assigns the requested issue to @issue" do
#         expect(assigns(:issue)).to eq issue
#       end

#       it "renders the :show template "  do
#         expect(response).to render_template :show
#       end
#     end
#   end
    
#   shared_examples("full access to issues") do
#     # new ===========
#     describe 'GET #new' do
#       before :each do
#         get :new
#       end

#       it "assigns a new Issue to @issue" do
#         expect(assigns(:issue)).to be_a_new(Issue)
#       end

#       it "renders the :new template" do
#         expect(response).to render_template :new
#       end
#     end

#     # edit ==========
#     describe 'GET #edit' do
#       it "assigns the requested issue to @issue" do
#         get :edit, id: issue
#         expect(assigns[:issue]).to eq issue
#       end

#       it "renders the :edit template" do
#         get :edit, id: issue
#         expect(response).to render_template :edit
#       end
#     end

#     # create ========
#     describe "POST #create" do
#       context "with valid attributes" do
#         before :each do
#           post :create, issue: attributes_for(:issue)
#         end

#         it "creates a new issue" do
#           expect(Issue.exists?(assigns[:issue])).to be_truthy
#         end

#         it "redirects to the new issue" do
#           expect(response).to redirect_to Issue.last
#         end
#       end

#       context "with invalid attributes" do
#         before :each do
#           post :create, issue: attributes_for(:invalid_issue)
#         end

#         it "does not save the new issue" do
#           expect(Issue.exists?(issue)).to be_falsey
#         end

#         it "re-renders the new method" do
#           expect(response).to render_template :new
#         end
#       end  
#     end

#     describe 'PATCH #update' do
#       before :each do
#         @issue = create(:issue, user_id: 1, title: 'test', content: 'test controller')
#       end

#       context "valid attributes" do
#         it "located the requested @issue" do
#           patch :update, id: @issue, issue: attributes_for(:issue)
#           expect(assigns(:issue)).to eq(@issue)
#         end

#         it "redirects to the updated issue" do
#           patch :update, id: issue, issue: attributes_for(:issue)
#           expect(response).to redirect_to issue
#         end
#       end
#     end

#     describe 'DELETE destroy' do
#       before :each do
#         allow(issue).to receive(:destroy).and_return(true)
#         delete :destroy, id: issue
#       end

#       it "deletes the issue" do
#         expect(Issue.exists?(issue)).to be_false
#       end

#       it "redirects to issues#index" do
#         expect(response).to redirect_to issues_url
#       end
#     end
#   end

#   #user access
#   describe "user access" do
#     before :each do
#       set_user_session(create(:user))
#     end

#     it_behaves_like "public access to issues"
#     it_behaves_like "full access to issues"
#   end

#   # guest access 
#   describe "guest access" do
#     it_behaves_like "public access to issues"

#     describe 'GET #new' do
#       it "requires login" do
#         get :new
#         expect(response).to require_login
#       end
#     end

#     describe "POST #create" do
#       it "requires login" do
#         post :create, issue: attributes_for(:issue)
#         expect(response).to require_login
#       end
#     end

#     describe 'PATCH #update' do
#       it "requires login" do
#         patch :update, id: issue, issue: attributes_for(:issue)
#         expect(response).to require_login
#       end
#     end

#     describe 'DELETE #destroy' do
#       it "requires login" do
#         delete :destroy, id: issue
#         expect(response).to require_login
#       end
#     end
#   end
  
end

